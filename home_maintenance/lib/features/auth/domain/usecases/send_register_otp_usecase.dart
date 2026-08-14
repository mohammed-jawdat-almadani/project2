import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

@injectable
class SendRegisterOtpUseCase implements UseCase<String?, SendRegisterOtpParams> {
  final AuthRepository repository;

  SendRegisterOtpUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call(SendRegisterOtpParams params) {
    return repository.sendRegisterOtp(phone: params.phone);
  }
}

class SendRegisterOtpParams {
  final String phone;

  SendRegisterOtpParams({required this.phone});
}
