import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/notification_item.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationItem>>> getNotifications({String? status, int page = 1});
  Future<Either<Failure, int>> getUnreadCount();
  Future<Either<Failure, void>> markOneRead(int notificationId);
  Future<Either<Failure, int>> markAllRead();
}
