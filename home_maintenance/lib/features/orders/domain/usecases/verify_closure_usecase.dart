import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_item.dart';
import '../repositories/orders_repository.dart';

class VerifyClosureParams {
  final int orderId;
  final String code;

  VerifyClosureParams({required this.orderId, required this.code});
}

@injectable
class VerifyClosureUseCase implements UseCase<OrderItem, VerifyClosureParams> {
  final OrdersRepository repository;

  VerifyClosureUseCase(this.repository);

  @override
  Future<Either<Failure, OrderItem>> call(VerifyClosureParams params) {
    return repository.verifyClosure(
      orderId: params.orderId,
      code: params.code,
    );
  }
}
