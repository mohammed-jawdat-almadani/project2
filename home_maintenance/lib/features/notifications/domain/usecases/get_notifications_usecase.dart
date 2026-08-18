import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/notification_item.dart';
import '../repositories/notifications_repository.dart';

class GetNotificationsParams {
  final String? status;
  final int page;

  const GetNotificationsParams({this.status, this.page = 1});
}

@injectable
class GetNotificationsUseCase implements UseCase<List<NotificationItem>, GetNotificationsParams> {
  final NotificationsRepository repository;

  GetNotificationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<NotificationItem>>> call(GetNotificationsParams params) {
    return repository.getNotifications(
      status: params.status,
      page: params.page,
    );
  }
}
