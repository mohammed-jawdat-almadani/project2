import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/notifications_repository.dart';

@injectable
class MarkNotificationReadUseCase implements UseCase<void, int> {
  final NotificationsRepository repository;

  MarkNotificationReadUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int notificationId) {
    return repository.markOneRead(notificationId);
  }
}
