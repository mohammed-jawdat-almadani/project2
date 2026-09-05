import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/chat_message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatMessageModel>> getMessages(int orderId, {int page = 1});
  Future<ChatMessageModel> sendMessage(
    int orderId, {
    String? messageText,
    String? imagePath,
  });
  Future<void> markRead(int orderId);
}

@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final Dio _dio;

  ChatRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ChatMessageModel>> getMessages(int orderId, {int page = 1}) async {
    final response = await _dio.get(
      '/api/orders/$orderId/messages',
      queryParameters: {'page': page},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data['data'] as List<dynamic>?) ?? [];
      return data
          .map((json) => ChatMessageModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<ChatMessageModel> sendMessage(
    int orderId, {
    String? messageText,
    String? imagePath,
  }) async {
    final formDataMap = <String, dynamic>{};

    if (messageText != null && messageText.trim().isNotEmpty) {
      formDataMap['message_text'] = messageText.trim();
    }

    if (imagePath != null && imagePath.isNotEmpty) {
      final fileName = imagePath.split('/').last.split('\\').last;
      formDataMap['image'] = await MultipartFile.fromFile(
        imagePath,
        filename: fileName,
      );
    }

    final formData = FormData.fromMap(formDataMap);

    final response = await _dio.post(
      '/api/orders/$orderId/messages',
      data: formData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data['data'] as Map<String, dynamic>;
      return ChatMessageModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> markRead(int orderId) async {
    final response = await _dio.post('/api/orders/$orderId/messages/read');
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
