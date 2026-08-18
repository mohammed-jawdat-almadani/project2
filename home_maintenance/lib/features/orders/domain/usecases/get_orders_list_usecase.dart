import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_item.dart';
import '../repositories/orders_repository.dart';

class GetOrdersListParams {
  final String? status;

  GetOrdersListParams({this.status});
}

@injectable
class GetOrdersListUseCase implements UseCase<List<OrderItem>, GetOrdersListParams> {
  final OrdersRepository repository;

  GetOrdersListUseCase(this.repository);

  @override
  Future<Either<Failure, List<OrderItem>>> call(GetOrdersListParams params) {
    return repository.getOrders(status: params.status);
  }
}
