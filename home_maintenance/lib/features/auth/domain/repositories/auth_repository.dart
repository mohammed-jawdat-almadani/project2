import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({required String phone, required String password});
  Future<Either<Failure, String?>> sendRegisterOtp({required String phone});
  Future<Either<Failure, void>> forgotPassword({required String phone});
}
