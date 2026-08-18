import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_part.freezed.dart';

@freezed
abstract class QuotePart with _$QuotePart {
  const factory QuotePart({
    int? id,
    required String name,
    required String price,
    @Default('standard') String classification, // 'standard', 'original', 'commercial'
    String? imageUrl,
    File? localImage,
  }) = _QuotePart;
}
