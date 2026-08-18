import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/notification_item.dart';

part 'notification_item_model.freezed.dart';
part 'notification_item_model.g.dart';

@freezed
abstract class NotificationItemModel with _$NotificationItemModel {
  const NotificationItemModel._();

  const factory NotificationItemModel({
    required int id,
    @Default('orders') String category,
    required String title,
    required String body,
    Map<String, dynamic>? target,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'read_at') String? readAt,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _NotificationItemModel;

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemModelFromJson(json);

  NotificationItem toEntity() {
    String? targetType;
    int? targetId;

    if (target != null) {
      targetType = target!['type'] as String?;
      final rawId = target!['id'];
      if (rawId is int) {
        targetId = rawId;
      } else if (rawId != null) {
        targetId = int.tryParse(rawId.toString());
      }
    }

    return NotificationItem(
      id: id,
      category: category,
      title: title,
      body: body,
      targetType: targetType,
      targetId: targetId,
      isRead: isRead,
      readAt: readAt != null ? DateTime.tryParse(readAt!) : null,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
    );
  }
}
