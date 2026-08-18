import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enums/user_role.dart';

import '../models/user_model.dart';
import '../models/office_model.dart';
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
  Future<List<OfficeModel>> getOffices();
  Future<void> registerDeviceToken({required String token, String platform = 'android'});
  Future<void> deleteDeviceToken({required String token});
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
        await _secureStorage.write(key: 'auth_user_id', value: user.id.toString());
        await _secureStorage.write(key: 'auth_user_name', value: user.name);
        await _secureStorage.write(key: 'auth_user_phone', value: user.phone);
        if (user.profileImageUrl != null) {
          await _secureStorage.write(key: 'auth_user_photo', value: user.profileImageUrl);
        }
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

  MediaType _getImageMediaType(String filename) {
    final ext = filename.split('.').last.toLowerCase();
    switch (ext) {
      case 'png':
        return MediaType('image', 'png');
      case 'webp':
        return MediaType('image', 'webp');
      case 'jpg':
      case 'jpeg':
      default:
        return MediaType('image', 'jpeg');
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
    final map = <String, dynamic>{
      'phone': formattedPhone,
      'name': name.trim(),
      'password': password,
      'password_confirmation': passwordConfirmation,
      'charter_accepted': '1',
      'ticket': ticket,
    };

    if (selfiePath != null && selfiePath.isNotEmpty) {
      final filename = selfiePath.split(RegExp(r'[\\/]')).last;
      map['selfie'] = await MultipartFile.fromFile(
        selfiePath,
        filename: filename,
        contentType: _getImageMediaType(filename),
      );
      map['profile_photo'] = await MultipartFile.fromFile(
        selfiePath,
        filename: filename,
        contentType: _getImageMediaType(filename),
      );
    }
    if (idFrontPath != null && idFrontPath.isNotEmpty) {
      final filename = idFrontPath.split(RegExp(r'[\\/]')).last;
      map['id_front'] = await MultipartFile.fromFile(
        idFrontPath,
        filename: filename,
        contentType: _getImageMediaType(filename),
      );
    }
    if (idBackPath != null && idBackPath.isNotEmpty) {
      final filename = idBackPath.split(RegExp(r'[\\/]')).last;
      map['id_back'] = await MultipartFile.fromFile(
        idBackPath,
        filename: filename,
        contentType: _getImageMediaType(filename),
      );
    }

    final formData = FormData.fromMap(map);

    // 1. Create technician account
    final response = await _dio.post(
      '/api/auth/register/technician',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final token = response.data['token'];
      final user = UserModel.fromJson(response.data['user']);
      if (token != null) {
        await _secureStorage.write(key: 'auth_token', value: token);
        await _secureStorage.write(key: 'auth_role', value: user.role.value);
        await _secureStorage.write(key: 'auth_user_id', value: user.id.toString());
        await _secureStorage.write(key: 'auth_user_name', value: user.name);
        await _secureStorage.write(key: 'auth_user_phone', value: user.phone);
        if (user.profileImageUrl != null) {
          await _secureStorage.write(key: 'auth_user_photo', value: user.profileImageUrl);
        }
      }
      if (selfiePath != null && selfiePath.isNotEmpty) {
        await _secureStorage.write(key: 'auth_local_photo_path', value: selfiePath);
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
    final techResponse = await _dio.get('/api/technician/me');
    if (techResponse.statusCode == 200) {
      final data = Map<String, dynamic>.from(techResponse.data['data'] as Map);

      try {
        final authMe = await _dio.get('/api/auth/me');
        if (authMe.statusCode == 200 && authMe.data != null) {
          final userData = authMe.data is Map
              ? (authMe.data['data'] ?? authMe.data['user'] ?? authMe.data)
              : null;
          if (userData is Map) {
            if (userData['name'] != null && userData['name'].toString().isNotEmpty) {
              data['name'] = userData['name'];
              await _secureStorage.write(key: 'auth_user_name', value: userData['name'].toString());
            }
            if (userData['phone'] != null && userData['phone'].toString().isNotEmpty) {
              data['phone'] = userData['phone'];
              await _secureStorage.write(key: 'auth_user_phone', value: userData['phone'].toString());
            }
            if (userData['profile_image_url'] != null) {
              data['profile_photo_url'] = userData['profile_image_url'];
            }
          }
        }
      } catch (_) {}

      final savedName = await _secureStorage.read(key: 'auth_user_name');
      final savedPhone = await _secureStorage.read(key: 'auth_user_phone');
      final savedPhoto = await _secureStorage.read(key: 'auth_user_photo');
      final localPhoto = await _secureStorage.read(key: 'auth_local_photo_path');

      if ((data['name'] == null || data['name'].toString().isEmpty) && savedName != null) {
        data['name'] = savedName;
      }
      if ((data['phone'] == null || data['phone'].toString().isEmpty) && savedPhone != null) {
        data['phone'] = savedPhone;
      }
      if (data['profile_photo_url'] == null || data['profile_photo_url'].toString().isEmpty) {
        data['profile_photo_url'] = savedPhoto ?? localPhoto;
      }

      return data;
    } else {
      throw DioException(
        requestOptions: techResponse.requestOptions,
        response: techResponse,
      );
    }
  }

  @override
  Future<List<OfficeModel>> getOffices() async {
    final response = await _dio.get('/api/offices');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'] as List<dynamic>;
      return data.map((json) => OfficeModel.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> registerDeviceToken({required String token, String platform = 'android'}) async {
    final response = await _dio.post(
      '/api/device-tokens',
      data: {
        'token': token,
        'platform': platform,
      },
    );
    if (response.statusCode != 200 && response.statusCode != 201 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> deleteDeviceToken({required String token}) async {
    final response = await _dio.delete(
      '/api/device-tokens',
      data: {
        'token': token,
      },
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
