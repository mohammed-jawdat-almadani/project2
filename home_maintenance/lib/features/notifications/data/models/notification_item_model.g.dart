// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationItemModel _$NotificationItemModelFromJson(
  Map<String, dynamic> json,
) => _NotificationItemModel(
  id: (json['id'] as num).toInt(),
  category: json['category'] as String? ?? 'orders',
  title: json['title'] as String,
  body: json['body'] as String,
  target: json['target'] as Map<String, dynamic>?,
  isRead: json['is_read'] as bool? ?? false,
  readAt: json['read_at'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$NotificationItemModelToJson(
  _NotificationItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'title': instance.title,
  'body': instance.body,
  'target': instance.target,
  'is_read': instance.isRead,
  'read_at': instance.readAt,
  'created_at': instance.createdAt,
};
