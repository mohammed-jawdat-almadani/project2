import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/notification_item.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMarkingAllRead,
    @Default([]) List<NotificationItem> notifications,
    @Default(0) int unreadCount,
    String? currentFilter, // null for all, 'unread' for unread
    String? errorMessage,
    String? successMessage,
  }) = _NotificationsState;
}
