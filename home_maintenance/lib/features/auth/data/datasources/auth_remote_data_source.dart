import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String phone, required String password});
  Future<String?> sendRegisterOtp({required String phone});
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  AuthRemoteDataSourceImpl(this._dio, this._secureStorage);

  @override
  Future<UserModel> login({required String phone, required String password}) async {
    final response = await _dio.post(
      '/api/auth/login',
      data: {
        'phone': phone,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final token = response.data['token'];
      if (token != null) {
        await _secureStorage.write(key: 'auth_token', value: token);
      }
      return UserModel.fromJson(response.data['user']);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<String?> sendRegisterOtp({required String phone}) async {
    final response = await _dio.post(
      '/api/auth/register/start',
      data: {
        'phone': phone,
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
}
