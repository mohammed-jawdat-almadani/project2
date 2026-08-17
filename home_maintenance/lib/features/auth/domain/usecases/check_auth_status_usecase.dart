import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/enums/splash_auth_state.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class CheckAuthStatusUseCase implements UseCase<SplashAuthState, NoParams> {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  @override
  Future<Either<Failure, SplashAuthState>> call(NoParams params) async {
    return await repository.checkAuthStatus();
  }
}
