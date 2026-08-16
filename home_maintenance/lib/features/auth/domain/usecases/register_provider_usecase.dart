import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@injectable
class RegisterProviderUseCase implements UseCase<User, RegisterProviderParams> {
  final AuthRepository repository;

  RegisterProviderUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterProviderParams params) {
    return repository.registerProvider(
      phone: params.phone,
      ticket: params.ticket,
      name: '${params.firstName} ${params.lastName}',
      serviceCategoryIds: params.serviceCategoryIds,
      password: params.password,
      passwordConfirmation: params.passwordConfirmation,
      selfiePath: params.selfiePath,
      idFrontPath: params.idFrontPath,
      idBackPath: params.idBackPath,
    );
  }
}

class RegisterProviderParams {
  final String phone;
  final String ticket;
  final String firstName;
  final String lastName;
  final List<int> serviceCategoryIds;
  final String password;
  final String passwordConfirmation;
  final String? selfiePath;
  final String? idFrontPath;
  final String? idBackPath;

  RegisterProviderParams({
    required this.phone,
    required this.ticket,
    required this.firstName,
    required this.lastName,
    required this.serviceCategoryIds,
    required this.password,
    required this.passwordConfirmation,
    this.selfiePath,
    this.idFrontPath,
    this.idBackPath,
  });
}
