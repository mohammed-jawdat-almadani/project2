import 'package:freezed_annotation/freezed_annotation.dart';
import 'quote_part.dart';

part 'order_quote.freezed.dart';

@freezed
abstract class OrderQuote with _$OrderQuote {
  const factory OrderQuote({
    required int id,
    @Default('initial') String type, // 'initial', 'addon'
    @Default('pending') String status, // 'pending', 'accepted', 'rejected'
    required String laborCost,
    @Default(30) int warrantyDays,
    String? justification,
    String? total,
    DateTime? expiresAt,
    @Default([]) List<QuotePart> parts,
  }) = _OrderQuote;
}
