import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;

  ChatRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ChatMessage>>> getMessages(int orderId, {int page = 1}) async {
    try {
      final models = await _remoteDataSource.getMessages(orderId, page: page);
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في تحميل الرسائل',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, ChatMessage>> sendMessage(
    int orderId, {
    String? messageText,
    String? imagePath,
  }) async {
    try {
      final model = await _remoteDataSource.sendMessage(
        orderId,
        messageText: messageText,
        imagePath: imagePath,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في إرسال الرسالة',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> markRead(int orderId) async {
    try {
      await _remoteDataSource.markRead(orderId);
      return const Right(null);
    } catch (_) {
      return const Right(null); // Silent fail for mark-read
    }
  }
}
