import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/chat_message.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const ChatMessageModel._();

  const factory ChatMessageModel({
    required int id,
    @JsonKey(name: 'sender_id') required int senderId,
    @JsonKey(name: 'mine') @Default(false) bool isMine,
    String? text,
    @JsonKey(name: 'has_image') @Default(false) bool hasImage,
    @JsonKey(name: 'read_at') String? readAt,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  ChatMessage toEntity() {
    return ChatMessage(
      id: id,
      senderId: senderId,
      isMine: isMine,
      text: text,
      hasImage: hasImage,
      readAt: readAt != null ? DateTime.tryParse(readAt!) : null,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
    );
  }
}
