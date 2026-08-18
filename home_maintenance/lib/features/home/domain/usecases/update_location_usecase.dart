import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class UpdateLocationParams {
  final double currentLat;
  final double currentLng;

  const UpdateLocationParams({
    required this.currentLat,
    required this.currentLng,
  });
}

@injectable
class UpdateLocationUseCase implements UseCase<void, UpdateLocationParams> {
  final HomeRepository repository;

  UpdateLocationUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateLocationParams params) {
    return repository.updateLocation(
      currentLat: params.currentLat,
      currentLng: params.currentLng,
    );
  }
}
