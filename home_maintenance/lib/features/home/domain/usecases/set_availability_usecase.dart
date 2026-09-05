import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class SetAvailabilityParams {
  final bool isAvailable;
  final double? currentLat;
  final double? currentLng;

  const SetAvailabilityParams({
    required this.isAvailable,
    this.currentLat,
    this.currentLng,
  });
}

@injectable
class SetAvailabilityUseCase implements UseCase<bool, SetAvailabilityParams> {
  final HomeRepository repository;

  SetAvailabilityUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SetAvailabilityParams params) {
    return repository.setAvailability(
      isAvailable: params.isAvailable,
      currentLat: params.currentLat,
      currentLng: params.currentLng,
    );
  }
}
