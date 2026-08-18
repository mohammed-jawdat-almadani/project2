// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      type: json['type'] as String? ?? 'urgent',
      kind: json['kind'] as String? ?? 'normal',
      serviceCategoryId: json['service_category_id'],
      serviceCategory: json['service_category'] as Map<String, dynamic>?,
      address: json['address'] as Map<String, dynamic>?,
      client: json['client'] as Map<String, dynamic>?,
      lat: json['lat'],
      lng: json['lng'],
      description: json['description'] as String?,
      scheduledAt: json['scheduled_at'] as String?,
      arrivedAt: json['arrived_at'] as String?,
      partsWaitingUntil: json['parts_waiting_until'] as String?,
      inspectionFee: json['inspection_fee'],
      commissionRate: json['commission_rate'],
      photos:
          (json['photos'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'kind': instance.kind,
      'service_category_id': instance.serviceCategoryId,
      'service_category': instance.serviceCategory,
      'address': instance.address,
      'client': instance.client,
      'lat': instance.lat,
      'lng': instance.lng,
      'description': instance.description,
      'scheduled_at': instance.scheduledAt,
      'arrived_at': instance.arrivedAt,
      'parts_waiting_until': instance.partsWaitingUntil,
      'inspection_fee': instance.inspectionFee,
      'commission_rate': instance.commissionRate,
      'photos': instance.photos,
      'created_at': instance.createdAt,
    };
