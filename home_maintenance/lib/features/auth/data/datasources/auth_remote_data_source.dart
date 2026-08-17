import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enums/user_role.dart';

import '../models/user_model.dart';
import '../models/activation_center_model.dart';
import '../../domain/entities/category_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String phone, required String password});
  Future<String?> sendRegisterOtp({required String phone});
  Future<String> verifyRegisterOtp({required String phone, required String code});
  Future<List<CategoryModel>> getCategories();
  Future<UserModel> registerProvider({
    required String phone,
    required String ticket,
    required String name,
    required List<int> serviceCategoryIds,
    required String password,
    required String passwordConfirmation,
    String? selfiePath,
    String? idFrontPath,
    String? idBackPath,
  });
  Future<bool> hasToken();
  Future<String?> getUserRole();
  Future<Map<String, dynamic>> getTechnicianProfile();
  Future<List<ActivationCenterModel>> getActivationCenters();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  AuthRemoteDataSourceImpl(this._dio, this._secureStorage);

  @override
  Future<UserModel> login({required String phone, required String password}) async {
    final formattedPhone = phone.startsWith('0') ? phone : '0$phone';
    final response = await _dio.post(
      '/api/auth/login',
      data: {
        'phone': formattedPhone,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final token = response.data['token'];
      final user = UserModel.fromJson(response.data['user']);
      if (token != null) {
        await _secureStorage.write(key: 'auth_token', value: token);
        await _secureStorage.write(key: 'auth_role', value: user.role.value);
      }
      return user;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<String?> sendRegisterOtp({required String phone}) async {
    final formattedPhone = phone.startsWith('0') ? phone : '0$phone';
    final response = await _dio.post(
      '/api/auth/register/start',
      data: {
        'phone': formattedPhone,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['debug_code']?.toString();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<String> verifyRegisterOtp({required String phone, required String code}) async {
    final formattedPhone = phone.startsWith('0') ? phone : '0$phone';
    final response = await _dio.post(
      '/api/auth/register/verify',
      data: {
        'phone': formattedPhone,
        'code': code,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['ticket'].toString();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get('/api/categories');
    if (response.statusCode == 200) {
      final List data = response.data['data'];
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<UserModel> registerProvider({
    required String phone,
    required String ticket,
    required String name,
    required List<int> serviceCategoryIds,
    required String password,
    required String passwordConfirmation,
    String? selfiePath,
    String? idFrontPath,
    String? idBackPath,
  }) async {
    final formattedPhone = phone.startsWith('0') ? phone : '0$phone';
    final formData = FormData.fromMap({
      'phone': formattedPhone,
      'name': name,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'charter_accepted': 'true',
      'ticket': ticket,
    });

    if (selfiePath != null) {
      formData.files.add(MapEntry(
        'selfie',
        await MultipartFile.fromFile(selfiePath),
      ));
    }
    if (idFrontPath != null) {
      formData.files.add(MapEntry(
        'id_front',
        await MultipartFile.fromFile(idFrontPath),
      ));
    }
    if (idBackPath != null) {
      formData.files.add(MapEntry(
        'id_back',
        await MultipartFile.fromFile(idBackPath),
      ));
    }

    // 1. Create technician account
    final response = await _dio.post(
      '/api/auth/register/technician',
      data: formData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final token = response.data['token'];
      final user = UserModel.fromJson(response.data['user']);
      if (token != null) {
        await _secureStorage.write(key: 'auth_token', value: token);
        await _secureStorage.write(key: 'auth_role', value: user.role.value);
      }
      
      // 2. Set technician services using the new token
      await _dio.put(
        '/api/technician/services',
        data: {'service_category_ids': serviceCategoryIds},
      );

      return user;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<bool> hasToken() async {
    try {
      final token = await _secureStorage.read(key: 'auth_token');
      return token != null && token.isNotEmpty;
    } catch (e) {
      await _secureStorage.deleteAll();
      return false;
    }
  }

  @override
  Future<String?> getUserRole() async {
    try {
      return await _secureStorage.read(key: 'auth_role');
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>> getTechnicianProfile() async {
    final response = await _dio.get('/api/technician/me');
    if (response.statusCode == 200) {
      return response.data['data'] as Map<String, dynamic>;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<ActivationCenterModel>> getActivationCenters() async {
    try {
      final response = await _dio.get('/api/activation-centers');
      
      if (response.statusCode == 200) {
        final List data = response.data['data'];
        return data.map((json) => ActivationCenterModel.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Failed to get activation centers');
      }
    } catch (e) {
      throw Exception('Failed to communicate with server: $e');
    }
  }
}
