import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/notifications/notification_action_handler.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_notifications_usecase.dart';
import '../../domain/usecases/get_unread_count_usecase.dart';
import '../../domain/usecases/mark_all_notifications_read_usecase.dart';
import '../../domain/usecases/mark_notification_read_usecase.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

@lazySingleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final GetUnreadCountUseCase _getUnreadCountUseCase;
  final MarkNotificationReadUseCase _markNotificationReadUseCase;
  final MarkAllNotificationsReadUseCase _markAllNotificationsReadUseCase;
  final NotificationActionHandler _actionHandler;

  StreamSubscription? _notificationSubscription;

  NotificationsBloc(
    this._getNotificationsUseCase,
    this._getUnreadCountUseCase,
    this._markNotificationReadUseCase,
    this._markAllNotificationsReadUseCase,
    this._actionHandler,
  ) : super(const NotificationsState()) {
    // Listen to real-time incoming push notifications to auto-refresh
    _notificationSubscription =
        _actionHandler.onNotificationReceived.listen((_) {
      add(const NotificationsEvent.refresh());
      add(const NotificationsEvent.fetchUnreadCount());
    });

    on<NotificationsEvent>((event, emit) async {
      await event.when(
        fetch: (status, page) => _onFetch(status, page, emit),
        filterChanged: (status) => _onFilterChanged(status, emit),
        fetchUnreadCount: () => _onFetchUnreadCount(emit),
        markRead: (id) => _onMarkRead(id, emit),
        markAllRead: () => _onMarkAllRead(emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  Future<void> _onFetch(
    String? status,
    int page,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getNotificationsUseCase(
      GetNotificationsParams(status: status ?? state.currentFilter, page: page),
    );

    await result.fold(
      (failure) async {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (list) async {
        emit(state.copyWith(
          isLoading: false,
          notifications: list,
          currentFilter: status ?? state.currentFilter,
        ));
      },
    );

    add(const NotificationsEvent.fetchUnreadCount());
  }

  Future<void> _onFilterChanged(
    String? status,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(currentFilter: status));
    add(NotificationsEvent.fetch(status: status));
  }

  Future<void> _onFetchUnreadCount(Emitter<NotificationsState> emit) async {
    final result = await _getUnreadCountUseCase(NoParams());
    result.fold(
      (failure) {
        // Silent error
      },
      (count) {
        emit(state.copyWith(unreadCount: count));
      },
    );
  }

  Future<void> _onMarkRead(
    int notificationId,
    Emitter<NotificationsState> emit,
  ) async {
    final updatedList = state.notifications.map((item) {
      if (item.id == notificationId) {
        return item.copyWith(isRead: true, readAt: DateTime.now());
      }
      return item;
    }).toList();

    final newCount = (state.unreadCount > 0) ? state.unreadCount - 1 : 0;
    emit(state.copyWith(
      notifications: updatedList,
      unreadCount: newCount,
    ));

    await _markNotificationReadUseCase(notificationId);
  }

  Future<void> _onMarkAllRead(Emitter<NotificationsState> emit) async {
    emit(state.copyWith(isMarkingAllRead: true, errorMessage: null));

    final result = await _markAllNotificationsReadUseCase(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          isMarkingAllRead: false,
          errorMessage: failure.message,
        ));
      },
      (updatedCount) {
        final updatedList = state.notifications.map((item) {
          return item.copyWith(isRead: true, readAt: DateTime.now());
        }).toList();

        emit(state.copyWith(
          isMarkingAllRead: false,
          notifications: updatedList,
          unreadCount: 0,
          successMessage: 'تم تحديد كافة الإشعارات كمقروءة',
        ));
      },
    );
  }

  Future<void> _onRefresh(Emitter<NotificationsState> emit) async {
    add(NotificationsEvent.fetch(status: state.currentFilter));
  }

  @override
  Future<void> close() {
    _notificationSubscription?.cancel();
    return super.close();
  }
}
