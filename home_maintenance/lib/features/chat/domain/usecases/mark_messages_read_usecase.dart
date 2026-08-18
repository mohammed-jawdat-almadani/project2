import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

@injectable
class MarkMessagesReadUseCase implements UseCase<void, int> {
  final ChatRepository repository;

  MarkMessagesReadUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int orderId) {
    return repository.markRead(orderId);
  }
}
