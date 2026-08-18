// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TechnicianProfileModel _$TechnicianProfileModelFromJson(
  Map<String, dynamic> json,
) => _TechnicianProfileModel(
  id: (json['id'] as num).toInt(),
  status: json['status'] as String? ?? 'pending',
  isAvailable: json['is_available'] as bool? ?? false,
  ratingAvg: json['rating_avg'] as String? ?? '0.00',
  serviceCategoryIds:
      (json['service_category_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  currentLat: json['current_lat'],
  currentLng: json['current_lng'],
  user: json['user'] as Map<String, dynamic>?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  createdAt: json['created_at'] as String?,
  completedOrdersCount: (json['completed_orders_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TechnicianProfileModelToJson(
  _TechnicianProfileModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'is_available': instance.isAvailable,
  'rating_avg': instance.ratingAvg,
  'service_category_ids': instance.serviceCategoryIds,
  'current_lat': instance.currentLat,
  'current_lng': instance.currentLng,
  'user': instance.user,
  'name': instance.name,
  'phone': instance.phone,
  'created_at': instance.createdAt,
  'completed_orders_count': instance.completedOrdersCount,
};
