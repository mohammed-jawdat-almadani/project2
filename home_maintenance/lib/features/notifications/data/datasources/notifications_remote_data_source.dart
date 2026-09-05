import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/notification_item_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationItemModel>> getNotifications({String? status, int page = 1});
  Future<int> getUnreadCount();
  Future<void> markOneRead(int notificationId);
  Future<int> markAllRead();
}

@LazySingleton(as: NotificationsRemoteDataSource)
class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final Dio _dio;

  NotificationsRemoteDataSourceImpl(this._dio);

  @override
  Future<List<NotificationItemModel>> getNotifications({String? status, int page = 1}) async {
    final queryParams = <String, dynamic>{
      'page': page,
    };
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }

    final response = await _dio.get(
      '/api/notifications',
      queryParameters: queryParams,
    );

    if (response.statusCode == 200) {
      final List<dynamic> list = (response.data['data'] as List<dynamic>?) ?? [];
      return list
          .map((json) => NotificationItemModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<int> getUnreadCount() async {
    final response = await _dio.get('/api/notifications/unread-count');
    if (response.statusCode == 200) {
      final data = response.data['data'];
      if (data is Map && data['count'] != null) {
        return (data['count'] as num).toInt();
      } else if (response.data['count'] != null) {
        return (response.data['count'] as num).toInt();
      } else if (data is num) {
        return data.toInt();
      }
      return 0;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> markOneRead(int notificationId) async {
    final response = await _dio.post('/api/notifications/$notificationId/read');
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<int> markAllRead() async {
    final response = await _dio.post('/api/notifications/read-all');
    if (response.statusCode == 200) {
      final updated = response.data['updated'];
      return (updated is num) ? updated.toInt() : 0;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
