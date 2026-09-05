import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dispatch_offer.dart';

part 'dispatch_offer_model.freezed.dart';
part 'dispatch_offer_model.g.dart';

@freezed
abstract class DispatchOfferModel with _$DispatchOfferModel {
  const DispatchOfferModel._();

  const factory DispatchOfferModel({
    required int id,
    String? status,
    @JsonKey(name: 'offered_at') String? offeredAt,
    @JsonKey(name: 'expires_at') String? expiresAt,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'service_name') String? serviceName,
    @JsonKey(name: 'client_name') String? clientName,
    @JsonKey(name: 'client_phone') String? clientPhone,
    @JsonKey(name: 'client_address') String? clientAddress,
    @JsonKey(name: 'client_lat') double? clientLat,
    @JsonKey(name: 'client_lng') double? clientLng,
    String? price,
    @JsonKey(name: 'distance_km') String? distanceKm,
    Map<String, dynamic>? order,
  }) = _DispatchOfferModel;

  factory DispatchOfferModel.fromJson(Map<String, dynamic> json) =>
      _$DispatchOfferModelFromJson(json);

  DispatchOffer toEntity() {
    final orderData = order ?? {};
    final addressData = orderData['address'] is Map<String, dynamic>
        ? orderData['address'] as Map<String, dynamic>
        : <String, dynamic>{};
    final clientData = orderData['client'] is Map<String, dynamic>
        ? orderData['client'] as Map<String, dynamic>
        : <String, dynamic>{};
    final categoryData = orderData['service_category'] is Map<String, dynamic>
        ? orderData['service_category'] as Map<String, dynamic>
        : (orderData['category'] is Map<String, dynamic>
            ? orderData['category'] as Map<String, dynamic>
            : <String, dynamic>{});

    final extractedServiceName = serviceName ??
        categoryData['name'] as String? ??
        orderData['service_name'] as String? ??
        'طلب صيانة';

    final extractedClientName = clientName ??
        clientData['name'] as String? ??
        orderData['client_name'] as String? ??
        'العميل';

    final extractedClientPhone = clientPhone ??
        clientData['phone'] as String? ??
        orderData['client_phone'] as String? ??
        '';

    final extractedAddressLabel = addressData['label'] as String?;
    final extractedBuildingNo = addressData['building_no']?.toString();
    final extractedFloor = addressData['floor']?.toString();
    final extractedNotes = addressData['notes'] as String?;

    // Build combined address string if not directly provided
    String formattedAddress = clientAddress ?? '';
    if (formattedAddress.isEmpty) {
      final parts = <String>[];
      if (extractedAddressLabel != null && extractedAddressLabel.isNotEmpty) {
        parts.add(extractedAddressLabel);
      }
      if (extractedBuildingNo != null && extractedBuildingNo.isNotEmpty) {
        parts.add('بناء $extractedBuildingNo');
      }
      if (extractedFloor != null && extractedFloor.isNotEmpty) {
        parts.add('طابق $extractedFloor');
      }
      if (extractedNotes != null && extractedNotes.isNotEmpty) {
        parts.add('($extractedNotes)');
      }
      formattedAddress = parts.isNotEmpty ? parts.join('، ') : 'دمشق';
    }

    final latVal = clientLat ??
        (orderData['lat'] != null ? double.tryParse(orderData['lat'].toString()) : null) ??
        (addressData['lat'] != null ? double.tryParse(addressData['lat'].toString()) : null) ??
        33.5138;

    final lngVal = clientLng ??
        (orderData['lng'] != null ? double.tryParse(orderData['lng'].toString()) : null) ??
        (addressData['lng'] != null ? double.tryParse(addressData['lng'].toString()) : null) ??
        36.2765;

    final inspectionFeeVal = orderData['inspection_fee']?.toString();
    final commissionRateVal = orderData['commission_rate']?.toString();
    final orderTypeVal = orderData['type'] as String? ?? 'urgent';
    final orderKindVal = orderData['kind'] as String? ?? 'normal';
    final serviceCatId = orderData['service_category_id'] as int?;
    final desc = orderData['description'] as String?;

    // Photos extraction
    final photoList = <String>[];
    if (orderData['photos'] is List) {
      for (final p in orderData['photos'] as List) {
        if (p is Map<String, dynamic> && p['url'] != null) {
          photoList.add(p['url'].toString());
        } else if (p is String) {
          photoList.add(p);
        }
      }
    }

    final extractedPrice = price ??
        (inspectionFeeVal != null ? '$inspectionFeeVal ل.س (كشف)' : 'حسب المعاينة');

    DateTime? parsedExpiry;
    if (expiresAt != null) {
      parsedExpiry = DateTime.tryParse(expiresAt!);
    }

    DateTime? parsedOfferedAt;
    if (offeredAt != null) {
      parsedOfferedAt = DateTime.tryParse(offeredAt!);
    }

    DateTime? parsedScheduledAt;
    if (orderData['scheduled_at'] != null) {
      parsedScheduledAt = DateTime.tryParse(orderData['scheduled_at'].toString());
    }

    final arrivedAtStr = (orderData['arrived_at'] ?? orderData['arrivedAt'])?.toString();
    DateTime? parsedArrivedAt;
    if (arrivedAtStr != null && arrivedAtStr.isNotEmpty) {
      parsedArrivedAt = DateTime.tryParse(arrivedAtStr);
    }

    String resolvedStatus = status ?? orderData['status'] as String? ?? 'offered';
    if (parsedArrivedAt != null && resolvedStatus.toLowerCase() == 'accepted') {
      resolvedStatus = 'arrived';
    }

    return DispatchOffer(
      id: id,
      orderId: orderId ?? (orderData['id'] as int? ?? id),
      serviceName: extractedServiceName,
      clientName: extractedClientName,
      clientPhone: extractedClientPhone,
      clientAddress: formattedAddress,
      clientLat: latVal,
      clientLng: lngVal,
      price: extractedPrice,
      distanceKm: distanceKm,
      status: resolvedStatus,
      arrivedAt: parsedArrivedAt,
      orderType: orderTypeVal,
      orderKind: orderKindVal,
      serviceCategoryId: serviceCatId,
      description: desc,
      inspectionFee: inspectionFeeVal,
      commissionRate: commissionRateVal,
      addressLabel: extractedAddressLabel,
      buildingNo: extractedBuildingNo,
      floor: extractedFloor,
      addressNotes: extractedNotes,
      photos: photoList,
      offeredAt: parsedOfferedAt,
      expiresAt: parsedExpiry,
      scheduledAt: parsedScheduledAt,
    );
  }
}
