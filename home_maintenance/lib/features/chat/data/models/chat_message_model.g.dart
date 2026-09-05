// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _ChatMessageModel(
      id: (json['id'] as num).toInt(),
      senderId: (json['sender_id'] as num).toInt(),
      isMine: json['mine'] as bool? ?? false,
      text: json['text'] as String?,
      hasImage: json['has_image'] as bool? ?? false,
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_id': instance.senderId,
      'mine': instance.isMine,
      'text': instance.text,
      'has_image': instance.hasImage,
      'read_at': instance.readAt,
      'created_at': instance.createdAt,
    };
