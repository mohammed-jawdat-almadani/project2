import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_quote.dart';
import 'quote_part_model.dart';

part 'order_quote_model.freezed.dart';
part 'order_quote_model.g.dart';

@freezed
abstract class OrderQuoteModel with _$OrderQuoteModel {
  const OrderQuoteModel._();

  const factory OrderQuoteModel({
    required int id,
    @Default('initial') String type,
    @Default('pending') String status,
    @JsonKey(name: 'labor_cost') required dynamic laborCost,
    @JsonKey(name: 'warranty_days') dynamic warrantyDays,
    String? justification,
    dynamic total,
    @JsonKey(name: 'expires_at') String? expiresAt,
    @Default([]) List<QuotePartModel> parts,
  }) = _OrderQuoteModel;

  factory OrderQuoteModel.fromJson(Map<String, dynamic> json) =>
      _$OrderQuoteModelFromJson(json);

  OrderQuote toEntity() {
    int parsedWarranty = 30;
    if (warrantyDays is int) {
      parsedWarranty = warrantyDays as int;
    } else if (warrantyDays is String) {
      parsedWarranty = int.tryParse(warrantyDays as String) ?? 30;
    }

    return OrderQuote(
      id: id,
      type: type,
      status: status,
      laborCost: laborCost.toString(),
      warrantyDays: parsedWarranty,
      justification: justification,
      total: total?.toString(),
      expiresAt: expiresAt != null ? DateTime.tryParse(expiresAt!) : null,
      parts: parts.map((p) => p.toEntity()).toList(),
    );
  }
}
