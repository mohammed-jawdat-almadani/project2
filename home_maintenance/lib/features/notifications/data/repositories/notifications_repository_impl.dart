import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/notification_item.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_remote_data_source.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource _remoteDataSource;

  NotificationsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<NotificationItem>>> getNotifications({
    String? status,
    int page = 1,
  }) async {
    try {
      final models = await _remoteDataSource.getNotifications(
        status: status,
        page: page,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب الإشعارات',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    try {
      final count = await _remoteDataSource.getUnreadCount();
      return Right(count);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب عدد الإشعارات',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> markOneRead(int notificationId) async {
    try {
      await _remoteDataSource.markOneRead(notificationId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في تحديث حالة الإشعار',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, int>> markAllRead() async {
    try {
      final updated = await _remoteDataSource.markAllRead();
      return Right(updated);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في تحديد كافة الإشعارات كمقروءة',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
