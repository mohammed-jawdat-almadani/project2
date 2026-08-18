import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.freezed.dart';

@freezed
abstract class ChatEvent with _$ChatEvent {
  const factory ChatEvent.init(int orderId) = _Init;
  const factory ChatEvent.poll() = _Poll;
  const factory ChatEvent.sendMessage({
    String? messageText,
    String? imagePath,
  }) = _SendMessage;
  const factory ChatEvent.markRead() = _MarkRead;
}
