import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

@injectable
class GetAvailabilityUseCase implements UseCase<bool, NoParams> {
  final HomeRepository repository;

  GetAvailabilityUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.getAvailability();
  }
}
