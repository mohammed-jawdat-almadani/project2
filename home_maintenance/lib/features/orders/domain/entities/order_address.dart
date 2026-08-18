import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_address.freezed.dart';

@freezed
abstract class OrderAddress with _$OrderAddress {
  const factory OrderAddress({
    required int id,
    String? label,
    double? lat,
    double? lng,
    String? buildingNo,
    String? floor,
    String? notes,
  }) = _OrderAddress;
}
