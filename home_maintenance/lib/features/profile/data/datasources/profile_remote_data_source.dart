import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/fcm_service.dart';
import '../../../auth/domain/entities/category_model.dart';
import '../models/technician_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<TechnicianProfileModel> getProfile();
  Future<List<CategoryModel>> getCategories();
  Future<void> logout();
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;
  final FcmService _fcmService;

  ProfileRemoteDataSourceImpl(
    this._dio,
    this._secureStorage,
    this._fcmService,
  );

  @override
  Future<TechnicianProfileModel> getProfile() async {
    final response = await _dio.get('/api/technician/me');
    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>;
      return TechnicianProfileModel.fromJson(data);
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
      final List<dynamic> data = response.data['data'] as List<dynamic>;
      return data
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _fcmService.deleteTokenOnLogout();
      await _dio.post('/api/auth/logout');
    } catch (_) {
      // Proceed with local logout regardless of network failure
    } finally {
      await _secureStorage.deleteAll();
    }
  }
}
