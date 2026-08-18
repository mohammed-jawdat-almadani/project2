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
    final techResponse = await _dio.get('/api/technician/me');
    if (techResponse.statusCode == 200) {
      final data = Map<String, dynamic>.from(techResponse.data['data'] as Map);

      // Fetch user info directly from /api/auth/me
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
      } catch (_) {
        // Fallback to cache
      }

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

      return TechnicianProfileModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: techResponse.requestOptions,
        response: techResponse,
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
