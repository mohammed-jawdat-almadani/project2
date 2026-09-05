import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_photo_item.freezed.dart';

@freezed
abstract class OrderPhotoItem with _$OrderPhotoItem {
  const factory OrderPhotoItem({
    required int id,
    @Default('flaw') String kind,
    required String url,
  }) = _OrderPhotoItem;
}
