import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class SendMessageParams {
  final int orderId;
  final String? messageText;
  final String? imagePath;

  SendMessageParams({
    required this.orderId,
    this.messageText,
    this.imagePath,
  });
}

@injectable
class SendMessageUseCase implements UseCase<ChatMessage, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<Either<Failure, ChatMessage>> call(SendMessageParams params) {
    return repository.sendMessage(
      params.orderId,
      messageText: params.messageText,
      imagePath: params.imagePath,
    );
  }
}
