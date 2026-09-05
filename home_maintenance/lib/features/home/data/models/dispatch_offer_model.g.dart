// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispatch_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DispatchOfferModel _$DispatchOfferModelFromJson(Map<String, dynamic> json) =>
    _DispatchOfferModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String?,
      offeredAt: json['offered_at'] as String?,
      expiresAt: json['expires_at'] as String?,
      orderId: (json['order_id'] as num?)?.toInt(),
      serviceName: json['service_name'] as String?,
      clientName: json['client_name'] as String?,
      clientPhone: json['client_phone'] as String?,
      clientAddress: json['client_address'] as String?,
      clientLat: (json['client_lat'] as num?)?.toDouble(),
      clientLng: (json['client_lng'] as num?)?.toDouble(),
      price: json['price'] as String?,
      distanceKm: json['distance_km'] as String?,
      order: json['order'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DispatchOfferModelToJson(_DispatchOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'offered_at': instance.offeredAt,
      'expires_at': instance.expiresAt,
      'order_id': instance.orderId,
      'service_name': instance.serviceName,
      'client_name': instance.clientName,
      'client_phone': instance.clientPhone,
      'client_address': instance.clientAddress,
      'client_lat': instance.clientLat,
      'client_lng': instance.clientLng,
      'price': instance.price,
      'distance_km': instance.distanceKm,
      'order': instance.order,
    };
