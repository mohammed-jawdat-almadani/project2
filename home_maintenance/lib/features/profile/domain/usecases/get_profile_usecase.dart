import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/technician_profile.dart';
import '../repositories/profile_repository.dart';

@injectable
class GetProfileUseCase implements UseCase<TechnicianProfile, NoParams> {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<Failure, TechnicianProfile>> call(NoParams params) {
    return repository.getProfile();
  }
}
