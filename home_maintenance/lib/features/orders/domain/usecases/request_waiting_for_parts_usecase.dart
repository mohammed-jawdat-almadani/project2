import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/orders_repository.dart';

class WaitingForPartsParams {
  final int orderId;
  final String note;

  WaitingForPartsParams({required this.orderId, required this.note});
}

@injectable
class RequestWaitingForPartsUseCase implements UseCase<void, WaitingForPartsParams> {
  final OrdersRepository repository;

  RequestWaitingForPartsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(WaitingForPartsParams params) {
    return repository.requestWaitingForParts(
      orderId: params.orderId,
      note: params.note,
    );
  }
}
