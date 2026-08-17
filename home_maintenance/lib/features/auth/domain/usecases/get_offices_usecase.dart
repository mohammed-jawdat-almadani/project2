import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/office.dart';
import '../repositories/auth_repository.dart';

@injectable
class GetOfficesUseCase implements UseCase<List<Office>, NoParams> {
  final AuthRepository repository;

  GetOfficesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Office>>> call(NoParams params) {
    return repository.getOffices();
  }
}
