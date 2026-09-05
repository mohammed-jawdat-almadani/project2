import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/quote_part.dart';

part 'quote_part_model.freezed.dart';
part 'quote_part_model.g.dart';

@freezed
abstract class QuotePartModel with _$QuotePartModel {
  const QuotePartModel._();

  const factory QuotePartModel({
    int? id,
    required String name,
    required dynamic price,
    @Default('standard') String classification,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _QuotePartModel;

  factory QuotePartModel.fromJson(Map<String, dynamic> json) =>
      _$QuotePartModelFromJson(json);

  QuotePart toEntity() {
    return QuotePart(
      id: id,
      name: name,
      price: price?.toString() ?? '0.00',
      classification: classification,
      imageUrl: imageUrl,
    );
  }
}
