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
        try {
          final profile = await _remoteDataSource.getTechnicianProfile();
          final statusString = profile['status'] as String?;
          final status = TechnicianStatusX.fromValue(statusString);
          user = user.copyWith(technicianStatus: status ?? TechnicianStatus.pending);
        } catch (_) {
          user = user.copyWith(technicianStatus: TechnicianStatus.pending);
        }
      }
      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'فشل في تسجيل الدخول')));
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
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'فشل في إرسال رمز التحقق')));
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
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'رمز التحقق غير صحيح أو منتهي الصلاحية')));
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
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'حدث خطأ في الاتصال بالخادم')));
    } catch (e) {
      return const Left(ServerFailure('حدث خطأ غير متوقع'));
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
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'فشل في إكمال التسجيل')));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String phone}) {
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
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'حدث خطأ أثناء جلب قائمة المكاتب')));
    } catch (e) {
      return const Left(ServerFailure('حدث خطأ غير متوقع'));
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
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'فشل في تسجيل توكن الإشعارات')));
    } catch (e) {
      return const Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDeviceToken({required String token}) async {
    try {
      await _remoteDataSource.deleteDeviceToken(token: token);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_extractErrorMessage(e, defaultMessage: 'فشل في إلغاء توكن الإشعارات')));
    } catch (e) {
      return const Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  String _extractErrorMessage(DioException e, {String defaultMessage = 'حدث خطأ في الاتصال بالخادم'}) {
    if (e.response?.data != null) {
      final data = e.response!.data;
      if (data is Map) {
        // 1. Check for Laravel validation errors object
        if (data['errors'] != null && data['errors'] is Map) {
          final errors = data['errors'] as Map;
          final errorList = <String>[];
          for (final entry in errors.entries) {
            if (entry.value is List) {
              for (final msg in entry.value as List) {
                errorList.add(_translateServerMessage(msg.toString()));
              }
            } else if (entry.value is String) {
              errorList.add(_translateServerMessage(entry.value.toString()));
            }
          }
          if (errorList.isNotEmpty) {
            return errorList.first;
          }
        }

        // 2. Check for 'message' key
        if (data['message'] != null && data['message'].toString().isNotEmpty) {
          return _translateServerMessage(data['message'].toString());
        }

        // 3. Check for 'error' key
        if (data['error'] != null && data['error'].toString().isNotEmpty) {
          return _translateServerMessage(data['error'].toString());
        }
      }
    }

    // 4. Handle standard Dio network errors
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return 'تعذر الاتصال بالخادم، يرجى التحقق من اتصال الإنترنت';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 401) {
          return 'بيانات الدخول غير صحيحة أو انتهت صلاحية الجلسة';
        } else if (code == 403) {
          return 'غير مصرح لك بالقيام بهذا الإجراء أو الحساب محظور';
        } else if (code == 404) {
          return 'العنصر المطلوب غير موجود';
        } else if (code == 429) {
          return 'تم تجاوز الحد المسموح من المحاولات، يرجى الانتظار والمحاولة لاحقاً';
        } else if (code != null && code >= 500) {
          return 'حدث خطأ في الخادم، يرجى المحاولة لاحقاً';
        }
        break;
      default:
        break;
    }

    return defaultMessage;
  }

  String _translateServerMessage(String raw) {
    final lower = raw.toLowerCase();
    if (lower.contains('credentials do not match')) {
      return 'رقم الهاتف أو كلمة المرور غير صحيحة';
    }
    if (lower.contains('account is banned')) {
      return 'هذا الحساب محظور، يرجى التواصل مع الإدارة';
    }
    if (lower.contains('phone number is not verified')) {
      return 'رقم الهاتف غير مؤكد، يرجى تأكيد رقم الهاتف أولاً';
    }
    if (lower.contains('verification code is invalid or expired')) {
      return 'رمز التحقق غير صحيح أو منتهي الصلاحية';
    }
    if (lower.contains('verification is required or has expired') || lower.contains('ticket')) {
      return 'انتهت صلاحية جلسة التحقق، يرجى إعادة طلب رمز التحقق مجدداً';
    }
    if (lower.contains('too many attempts')) {
      return 'تم تجاوز الحد المسموح من المحاولات، يرجى المحاولة لاحقاً';
    }
    if (lower.contains('wait before requesting another code')) {
      return 'يرجى الانتظار قليلاً قبل طلب رمز جديد';
    }
    if (lower.contains('phone has already been taken')) {
      return 'رقم الهاتف هذا مسجل مسبقاً، يرجى تسجيل الدخول';
    }
    if (lower.contains('password is incorrect')) {
      return 'كلمة المرور غير صحيحة';
    }
    if (lower.contains('password confirmation does not match') || lower.contains('password_confirmation')) {
      return 'كلمتا المرور غير متطابقتين';
    }
    if (lower.contains('id_front') || lower.contains('id front')) {
      return 'يرجى رفع صورة واضحة للهوية (الوجه الأمامي)';
    }
    if (lower.contains('id_back') || lower.contains('id back')) {
      return 'يرجى رفع صورة واضحة للهوية (الوجه الخلفي)';
    }
    if (lower.contains('selfie') || lower.contains('personal photo')) {
      return 'يرجى التقاط ورفع صورتك الشخصية';
    }
    if (lower.contains('unauthenticated')) {
      return 'يرجى تسجيل الدخول أولاً للمتابعة';
    }

    return raw;
  }
}
