import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/notifications/notification_action_handler.dart';
import '../../domain/usecases/get_messages_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';
import '../../domain/usecases/mark_messages_read_usecase.dart';
import 'chat_event.dart';
import 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetMessagesUseCase _getMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final MarkMessagesReadUseCase _markMessagesReadUseCase;
  final NotificationActionHandler _notificationHandler;

  StreamSubscription? _notificationSubscription;

  ChatBloc(
    this._getMessagesUseCase,
    this._sendMessageUseCase,
    this._markMessagesReadUseCase,
    this._notificationHandler,
  ) : super(const ChatState()) {
    // Listen for real-time FCM incoming notifications for this chat thread
    _notificationSubscription =
        _notificationHandler.onNotificationReceived.listen((payload) {
      if (state.orderId != null &&
          (payload.orderId == state.orderId || payload.orderId == null)) {
        add(const ChatEvent.poll());
      }
    });

    on<ChatEvent>((event, emit) async {
      await event.map(
        init: (e) async => _onInit(e.orderId, emit),
        poll: (e) async => _onPoll(emit),
        sendMessage: (e) async => _onSendMessage(e.messageText, e.imagePath, emit),
        markRead: (e) async => _onMarkRead(emit),
      );
    });
  }

  Future<void> _onInit(int orderId, Emitter<ChatState> emit) async {
    emit(state.copyWith(orderId: orderId, isLoading: true, errorMessage: null));

    final result = await _getMessagesUseCase(GetMessagesParams(orderId: orderId));

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (messages) {
        emit(state.copyWith(
          isLoading: false,
          messages: messages,
        ));
        add(const ChatEvent.markRead());
      },
    );
  }

  Future<void> _onPoll(Emitter<ChatState> emit) async {
    if (state.orderId == null) return;

    final result = await _getMessagesUseCase(GetMessagesParams(orderId: state.orderId!));

    result.fold(
      (_) {},
      (messages) {
        // Update messages list when FCM triggers a refresh
        emit(state.copyWith(messages: messages));
        add(const ChatEvent.markRead());
      },
    );
  }

  Future<void> _onSendMessage(
    String? text,
    String? imagePath,
    Emitter<ChatState> emit,
  ) async {
    if (state.orderId == null) return;

    emit(state.copyWith(isSending: true, errorMessage: null));

    final result = await _sendMessageUseCase(SendMessageParams(
      orderId: state.orderId!,
      messageText: text,
      imagePath: imagePath,
    ));

    result.fold(
      (failure) {
        emit(state.copyWith(
          isSending: false,
          errorMessage: failure.message,
        ));
      },
      (newMessage) {
        final updatedList = [newMessage, ...state.messages];
        emit(state.copyWith(
          isSending: false,
          messages: updatedList,
        ));
      },
    );
  }

  Future<void> _onMarkRead(Emitter<ChatState> emit) async {
    if (state.orderId == null) return;
    await _markMessagesReadUseCase(state.orderId!);
  }

  @override
  Future<void> close() {
    _notificationSubscription?.cancel();
    return super.close();
  }
}
