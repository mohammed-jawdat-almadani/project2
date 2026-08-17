import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/activation_center.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class GetActivationCentersUseCase implements UseCase<List<ActivationCenter>, NoParams> {
  final AuthRepository repository;

  GetActivationCentersUseCase(this.repository);

  @override
  Future<Either<Failure, List<ActivationCenter>>> call(NoParams params) async {
    return await repository.getActivationCenters();
  }
}
