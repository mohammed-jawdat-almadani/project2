import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/chat_message.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    int? orderId,
    @Default(false) bool isLoading,
    @Default(false) bool isSending,
    @Default([]) List<ChatMessage> messages,
    String? errorMessage,
    String? successMessage,
  }) = _ChatState;
}
