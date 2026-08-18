import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_quote.dart';
import '../entities/quote_part.dart';
import '../repositories/orders_repository.dart';

class SendAddonQuoteParams {
  final int orderId;
  final String laborCost;
  final List<QuotePart> parts;

  SendAddonQuoteParams({
    required this.orderId,
    required this.laborCost,
    required this.parts,
  });
}

@injectable
class SendAddonQuoteUseCase implements UseCase<OrderQuote, SendAddonQuoteParams> {
  final OrdersRepository repository;

  SendAddonQuoteUseCase(this.repository);

  @override
  Future<Either<Failure, OrderQuote>> call(SendAddonQuoteParams params) {
    return repository.sendAddonQuote(
      orderId: params.orderId,
      laborCost: params.laborCost,
      parts: params.parts,
    );
  }
}
