import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

@injectable
class VerifyRegisterOtpUseCase implements UseCase<String, VerifyRegisterOtpParams> {
  final AuthRepository repository;

  VerifyRegisterOtpUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(VerifyRegisterOtpParams params) {
    return repository.verifyRegisterOtp(phone: params.phone, code: params.code);
  }
}

class VerifyRegisterOtpParams {
  final String phone;
  final String code;

  VerifyRegisterOtpParams({required this.phone, required this.code});
}
