import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class GetMessagesParams {
  final int orderId;
  final int page;

  GetMessagesParams({required this.orderId, this.page = 1});
}

@injectable
class GetMessagesUseCase implements UseCase<List<ChatMessage>, GetMessagesParams> {
  final ChatRepository repository;

  GetMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ChatMessage>>> call(GetMessagesParams params) {
    return repository.getMessages(params.orderId, page: params.page);
  }
}
