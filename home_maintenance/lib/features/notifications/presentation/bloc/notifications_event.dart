import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_event.freezed.dart';

@freezed
abstract class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.fetch({String? status, @Default(1) int page}) = _Fetch;
  const factory NotificationsEvent.filterChanged(String? status) = _FilterChanged;
  const factory NotificationsEvent.fetchUnreadCount() = _FetchUnreadCount;
  const factory NotificationsEvent.markRead(int notificationId) = _MarkRead;
  const factory NotificationsEvent.markAllRead() = _MarkAllRead;
  const factory NotificationsEvent.refresh() = _Refresh;
}
