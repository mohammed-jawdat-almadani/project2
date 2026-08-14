// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String,
  role: json['role'] as String,
  profileImageUrl: json['profile_image_url'] as String?,
  phoneVerifiedAt: json['phone_verified_at'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'role': instance.role,
      'profile_image_url': instance.profileImageUrl,
      'phone_verified_at': instance.phoneVerifiedAt,
      'created_at': instance.createdAt,
    };
