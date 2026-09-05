import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item.freezed.dart';

@freezed
abstract class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required int id,
    required String category, // 'orders', 'financial', 'admin'
    required String title,
    required String body,
    String? targetType,
    int? targetId,
    required bool isRead,
    DateTime? readAt,
    DateTime? createdAt,
  }) = _NotificationItem;
}
