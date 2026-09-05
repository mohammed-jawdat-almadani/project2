import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_address.dart';
import 'order_photo_item.dart';

part 'order_item.freezed.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required String status, // 'pending', 'accepted', 'assigned', 'arrived', 'in_progress', 'quoted', 'approved', 'parts_waiting', 'closure_requested', 'completed', 'cancelled', 'expired'
    @Default('urgent') String type, // 'urgent', 'scheduled'
    @Default('normal') String kind, // 'normal', 'warranty'
    int? serviceCategoryId,
    @Default('طلب صيانة') String serviceCategoryName,
    OrderAddress? address,
    double? lat,
    double? lng,
    String? description,
    DateTime? scheduledAt,
    DateTime? arrivedAt,
    DateTime? partsWaitingUntil,
    String? inspectionFee,
    String? commissionRate,
    @Default([]) List<OrderPhotoItem> photos,
    DateTime? createdAt,
    String? clientName,
    String? clientPhone,
  }) = _OrderItem;
}
