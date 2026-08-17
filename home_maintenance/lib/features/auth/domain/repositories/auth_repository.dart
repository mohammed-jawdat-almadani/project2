import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../entities/category_model.dart';
import '../entities/activation_center.dart';
import '../../../../core/enums/splash_auth_state.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({required String phone, required String password});
  Future<Either<Failure, String?>> sendRegisterOtp({required String phone});
  Future<Either<Failure, String>> verifyRegisterOtp({required String phone, required String code});
  Future<Either<Failure, List<CategoryModel>>> getCategories();
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
  });
  Future<Either<Failure, void>> forgotPassword({required String phone});
  Future<Either<Failure, SplashAuthState>> checkAuthStatus();
  Future<Either<Failure, List<ActivationCenter>>> getActivationCenters();
}
