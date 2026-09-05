import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatMessage>>> getMessages(int orderId, {int page = 1});
  Future<Either<Failure, ChatMessage>> sendMessage(
    int orderId, {
    String? messageText,
    String? imagePath,
  });
  Future<Either<Failure, void>> markRead(int orderId);
}
