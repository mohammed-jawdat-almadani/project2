import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/notifications_repository.dart';

@injectable
class MarkAllNotificationsReadUseCase implements UseCase<int, NoParams> {
  final NotificationsRepository repository;

  MarkAllNotificationsReadUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(NoParams params) {
    return repository.markAllRead();
  }
}
