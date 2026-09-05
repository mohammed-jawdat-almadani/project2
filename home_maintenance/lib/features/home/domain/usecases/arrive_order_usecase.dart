import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class ArriveOrderParams {
  final int orderId;
  final double lat;
  final double lng;

  ArriveOrderParams({
    required this.orderId,
    required this.lat,
    required this.lng,
  });
}

@injectable
class ArriveOrderUseCase implements UseCase<void, ArriveOrderParams> {
  final HomeRepository repository;

  ArriveOrderUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ArriveOrderParams params) {
    return repository.arriveOrder(
      params.orderId,
      lat: params.lat,
      lng: params.lng,
    );
  }
}
