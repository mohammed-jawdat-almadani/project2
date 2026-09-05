import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/technician_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, TechnicianProfile>> getProfile() async {
    try {
      final profileModel = await _remoteDataSource.getProfile();
      Map<int, String>? categoryMap;

      try {
        final categories = await _remoteDataSource.getCategories();
        categoryMap = {for (final c in categories) c.id: c.name};
      } catch (_) {
        // Fallback gracefully
      }

      return Right(profileModel.toEntity(categoryMap: categoryMap));
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في تحميل بيانات الملف الشخصي',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('فشل في تسجيل الخروج'));
    }
  }
}
