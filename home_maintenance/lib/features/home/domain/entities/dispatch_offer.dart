import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispatch_offer.freezed.dart';

@freezed
abstract class DispatchOffer with _$DispatchOffer {
  const factory DispatchOffer({
    required int id,
    required int orderId,
    required String serviceName,
    required String clientName,
    required String clientPhone,
    required String clientAddress,
    required double clientLat,
    required double clientLng,
    String? price,
    String? distanceKm,
    DateTime? offeredAt,
    DateTime? expiresAt,
    String? status,
    DateTime? arrivedAt,
    String? orderType, // 'urgent', 'scheduled'
    String? orderKind, // 'normal', 'warranty'
    int? serviceCategoryId,
    String? description,
    String? inspectionFee,
    String? commissionRate,
    String? addressLabel,
    String? buildingNo,
    String? floor,
    String? addressNotes,
    @Default([]) List<String> photos,
    DateTime? scheduledAt,
  }) = _DispatchOffer;
}
