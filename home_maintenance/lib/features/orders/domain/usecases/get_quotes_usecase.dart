import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_quote.dart';
import '../repositories/orders_repository.dart';

@injectable
class GetQuotesUseCase implements UseCase<List<OrderQuote>, int> {
  final OrdersRepository repository;

  GetQuotesUseCase(this.repository);

  @override
  Future<Either<Failure, List<OrderQuote>>> call(int orderId) {
    return repository.getQuotes(orderId);
  }
}
