import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_quote.dart';
import '../entities/quote_part.dart';
import '../repositories/orders_repository.dart';

class SendQuoteParams {
  final int orderId;
  final String laborCost;
  final int warrantyDays;
  final List<QuotePart> parts;

  SendQuoteParams({
    required this.orderId,
    required this.laborCost,
    required this.warrantyDays,
    required this.parts,
  });
}

@injectable
class SendQuoteUseCase implements UseCase<OrderQuote, SendQuoteParams> {
  final OrdersRepository repository;

  SendQuoteUseCase(this.repository);

  @override
  Future<Either<Failure, OrderQuote>> call(SendQuoteParams params) {
    return repository.sendQuote(
      orderId: params.orderId,
      laborCost: params.laborCost,
      warrantyDays: params.warrantyDays,
      parts: params.parts,
    );
  }
}
