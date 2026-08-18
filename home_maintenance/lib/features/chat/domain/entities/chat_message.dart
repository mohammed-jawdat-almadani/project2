import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required int id,
    required int senderId,
    required bool isMine,
    String? text,
    @Default(false) bool hasImage,
    DateTime? readAt,
    DateTime? createdAt,
  }) = _ChatMessage;
}
