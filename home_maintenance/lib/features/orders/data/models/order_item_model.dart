import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_address.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/order_photo_item.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const OrderItemModel._();

  const factory OrderItemModel({
    required int id,
    required String status,
    @Default('urgent') String type,
    @Default('normal') String kind,
    @JsonKey(name: 'service_category_id') dynamic serviceCategoryId,
    @JsonKey(name: 'service_category') Map<String, dynamic>? serviceCategory,
    Map<String, dynamic>? address,
    Map<String, dynamic>? client,
    dynamic lat,
    dynamic lng,
    String? description,
    @JsonKey(name: 'scheduled_at') String? scheduledAt,
    @JsonKey(name: 'arrived_at') String? arrivedAt,
    @JsonKey(name: 'parts_waiting_until') String? partsWaitingUntil,
    @JsonKey(name: 'inspection_fee') dynamic inspectionFee,
    @JsonKey(name: 'commission_rate') dynamic commissionRate,
    @Default([]) List<Map<String, dynamic>> photos,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  OrderItem toEntity({Map<int, String>? categoryNameMap}) {
    // Address extraction
    OrderAddress? orderAddress;
    if (address != null && address!.isNotEmpty) {
      final addrId = (address!['id'] as int?) ?? 0;
      final addrLat = address!['lat'] != null
          ? double.tryParse(address!['lat'].toString())
          : null;
      final addrLng = address!['lng'] != null
          ? double.tryParse(address!['lng'].toString())
          : null;

      orderAddress = OrderAddress(
        id: addrId,
        label: address!['label'] as String?,
        lat: addrLat,
        lng: addrLng,
        buildingNo: address!['building_no']?.toString(),
        floor: address!['floor']?.toString(),
        notes: address!['notes'] as String?,
      );
    }

    // Category ID resolution
    int? resolvedCatId;
    if (serviceCategoryId != null) {
      if (serviceCategoryId is int) {
        resolvedCatId = serviceCategoryId as int;
      } else {
        resolvedCatId = int.tryParse(serviceCategoryId.toString());
      }
    }

    // Service category name
    String resolvedCategoryName = 'طلب صيانة';
    if (serviceCategory != null && serviceCategory!['name'] != null) {
      resolvedCategoryName = serviceCategory!['name'].toString();
    } else if (resolvedCatId != null &&
        categoryNameMap != null &&
        categoryNameMap.containsKey(resolvedCatId)) {
      resolvedCategoryName = categoryNameMap[resolvedCatId]!;
    } else if (resolvedCatId == 1) {
      resolvedCategoryName = 'كهرباء';
    } else if (resolvedCatId == 2) {
      resolvedCategoryName = 'سباكة';
    } else if (resolvedCatId == 6) {
      resolvedCategoryName = 'سباكة وصيانة صحية';
    }

    // Photos list
    final photoEntities = <OrderPhotoItem>[];
    for (final p in photos) {
      final pId = (p['id'] as int?) ?? 0;
      final pKind = (p['kind'] as String?) ?? 'flaw';
      final pUrl = (p['url'] as String?) ??
          'https://home-maintenance.me/api/order-photos/$pId';
      photoEntities.add(OrderPhotoItem(id: pId, kind: pKind, url: pUrl));
    }

    // Client details
    String? clientNameVal;
    String? clientPhoneVal;
    if (client != null) {
      clientNameVal = client!['name'] as String?;
      clientPhoneVal = client!['phone'] as String?;
    }

    final latVal = lat != null ? double.tryParse(lat.toString()) : orderAddress?.lat;
    final lngVal = lng != null ? double.tryParse(lng.toString()) : orderAddress?.lng;
    final parsedArrivedAt = arrivedAt != null ? DateTime.tryParse(arrivedAt!) : null;
    String resolvedStatus = status;
    if (parsedArrivedAt != null && resolvedStatus.toLowerCase() == 'accepted') {
      resolvedStatus = 'arrived';
    }

    return OrderItem(
      id: id,
      status: resolvedStatus,
      type: type,
      kind: kind,
      serviceCategoryId: resolvedCatId,
      serviceCategoryName: resolvedCategoryName,
      address: orderAddress,
      lat: latVal,
      lng: lngVal,
      description: description,
      scheduledAt: scheduledAt != null ? DateTime.tryParse(scheduledAt!) : null,
      arrivedAt: parsedArrivedAt,
      partsWaitingUntil: partsWaitingUntil != null ? DateTime.tryParse(partsWaitingUntil!) : null,
      inspectionFee: inspectionFee?.toString(),
      commissionRate: commissionRate?.toString(),
      photos: photoEntities,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      clientName: clientNameVal ?? 'العميل',
      clientPhone: clientPhoneVal,
    );
  }
}
