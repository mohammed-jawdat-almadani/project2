import 'dart:io';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/order_item.dart';
import '../entities/order_quote.dart';
import '../entities/quote_part.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrderItem>>> getOrders({String? status});
  Future<Either<Failure, OrderItem>> getOrderDetails(int orderId);
  Future<Either<Failure, OrderQuote>> sendQuote({
    required int orderId,
    required String laborCost,
    required int warrantyDays,
    required List<QuotePart> parts,
  });
  Future<Either<Failure, OrderQuote>> sendAddonQuote({
    required int orderId,
    required String laborCost,
    required List<QuotePart> parts,
  });
  Future<Either<Failure, List<OrderQuote>>> getQuotes(int orderId);
  Future<Either<Failure, void>> requestWaitingForParts({
    required int orderId,
    required String note,
  });
  Future<Either<Failure, void>> resumeOrder(int orderId);
  Future<Either<Failure, String>> requestClosure({
    required int orderId,
    required List<File> photos,
  });
  Future<Either<Failure, OrderItem>> verifyClosure({
    required int orderId,
    required String code,
  });
}
