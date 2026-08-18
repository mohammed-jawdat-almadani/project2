import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/category_model.dart';
import '../../domain/entities/office.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';
import '../../../../core/enums/splash_auth_state.dart';
import '../../../../core/enums/user_role.dart';
import '../../../../core/enums/technician_status.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, User>> login({required String phone, required String password}) async {
    try {
      final userModel = await _remoteDataSource.login(phone: phone, password: password);
      User user = userModel.toEntity();
      if (user.role == UserRole.technician) {
        final profile = await _remoteDataSource.getTechnicianProfile();
        final statusString = profile['status'] as String?;
        final status = TechnicianStatusX.fromValue(statusString);
        user = user.copyWith(technicianStatus: status);
      }
      return Right(user);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Left(ServerFailure('Invalid phone number or password.'));
      }
      return Left(ServerFailure(e.message ?? 'Unknown error occurred.'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> sendRegisterOtp({required String phone}) async {
    try {
      final debugCode = await _remoteDataSource.sendRegisterOtp(phone: phone);
      return Right(debugCode);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown error occurred.'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyRegisterOtp({required String phone, required String code}) async {
    try {
      final ticket = await _remoteDataSource.verifyRegisterOtp(phone: phone, code: code);
      return Right(ticket);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 422) {
        return const Left(ServerFailure('رمز التحقق غير صحيح.'));
      }
      return Left(ServerFailure(e.message ?? 'Unknown error occurred.'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      return Right(categories);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'حدث خطأ في الاتصال بالخادم'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, User>> registerProvider({
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
    try {
      final userModel = await _remoteDataSource.registerProvider(
        phone: phone,
        ticket: ticket,
        name: name,
        serviceCategoryIds: serviceCategoryIds,
        password: password,
        passwordConfirmation: passwordConfirmation,
        selfiePath: selfiePath,
        idFrontPath: idFrontPath,
        idBackPath: idBackPath,
      );
      final user = userModel.toEntity().copyWith(technicianStatus: TechnicianStatus.pending);
      return Right(user);
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return const Left(ServerFailure('بيانات غير صالحة، يرجى التأكد من الإدخال.'));
      }
      return Left(ServerFailure(e.message ?? 'Unknown error occurred.'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String phone}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SplashAuthState>> checkAuthStatus() async {
    try {
      final hasToken = await _remoteDataSource.hasToken();
      if (!hasToken) {
        return const Right(SplashAuthState.unauthenticated);
      }
      
      final roleString = await _remoteDataSource.getUserRole();
      final role = UserRoleX.fromValue(roleString);
      
      if (role == UserRole.client) {
        return const Right(SplashAuthState.client);
      } else {
        final profile = await _remoteDataSource.getTechnicianProfile();
        final statusString = profile['status'] as String?;
        final status = TechnicianStatusX.fromValue(statusString);
        
        if (status == TechnicianStatus.active || status == TechnicianStatus.probation) {
          return const Right(SplashAuthState.providerActive);
        } else if (status == TechnicianStatus.banned) {
          // You could return SplashAuthState.banned here if you create it
          return const Right(SplashAuthState.unauthenticated);
        } else {
          return const Right(SplashAuthState.providerPending);
        }
      }
    } catch (e) {
      return const Right(SplashAuthState.unauthenticated);
    }
  }

  @override
  Future<Either<Failure, List<Office>>> getOffices() async {
    try {
      final models = await _remoteDataSource.getOffices();
      return Right(models.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'حدث خطأ أثناء جلب قائمة المكاتب'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> registerDeviceToken({
    required String token,
    String platform = 'android',
  }) async {
    try {
      await _remoteDataSource.registerDeviceToken(token: token, platform: platform);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'فشل في تسجيل توكن الإشعارات'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDeviceToken({required String token}) async {
    try {
      await _remoteDataSource.deleteDeviceToken(token: token);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? 'فشل في إلغاء توكن الإشعارات'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
