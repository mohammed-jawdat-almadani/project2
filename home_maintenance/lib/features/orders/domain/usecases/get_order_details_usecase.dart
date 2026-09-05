import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_item.dart';
import '../repositories/orders_repository.dart';

@injectable
class GetOrderDetailsUseCase implements UseCase<OrderItem, int> {
  final OrdersRepository repository;

  GetOrderDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, OrderItem>> call(int orderId) {
    return repository.getOrderDetails(orderId);
  }
}
