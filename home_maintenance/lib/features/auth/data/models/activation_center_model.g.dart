// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activation_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivationCenterModel _$ActivationCenterModelFromJson(
  Map<String, dynamic> json,
) => _ActivationCenterModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  address: json['address'] as String,
  phone: json['phone'] as String,
);

Map<String, dynamic> _$ActivationCenterModelToJson(
  _ActivationCenterModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'phone': instance.phone,
};
