import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/dispatch_offer_model.dart';

abstract class HomeRemoteDataSource {
  Future<bool> setAvailability({
    required bool isAvailable,
    double? currentLat,
    double? currentLng,
  });

  Future<bool> getAvailability();

  Future<List<DispatchOfferModel>> getMyOffers();

  Future<List<DispatchOfferModel>> getOrders();

  Future<void> acceptOffer(int offerId);

  Future<void> declineOffer(int offerId, {String? reason});

  Future<void> updateLocation({
    required double currentLat,
    required double currentLng,
  });

  Future<void> arriveOrder(int orderId, {required double lat, required double lng});

  Future<void> withdrawOrder(int orderId, {String? reason});

  Future<void> reportClientNoShow(int orderId);
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<bool> setAvailability({
    required bool isAvailable,
    double? currentLat,
    double? currentLng,
  }) async {
    final data = <String, dynamic>{
      'is_available': isAvailable,
    };
    if (currentLat != null) data['current_lat'] = currentLat;
    if (currentLng != null) data['current_lng'] = currentLng;

    final response = await _dio.put(
      '/api/technician/availability',
      data: data,
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return isAvailable;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<bool> getAvailability() async {
    final response = await _dio.get('/api/technician/me');
    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>?;
      return (data?['is_available'] as bool?) ?? false;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<DispatchOfferModel>> getMyOffers() async {
    final response = await _dio.get('/api/technician/offers');
    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data['data'] as List<dynamic>?) ?? [];
      return data
          .map((json) => DispatchOfferModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<DispatchOfferModel>> getOrders() async {
    final response = await _dio.get('/api/orders');
    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data['data'] as List<dynamic>?) ?? [];
      return data.map((json) {
        final map = json as Map<String, dynamic>;
        if (map.containsKey('order') && map['order'] is Map<String, dynamic>) {
          return DispatchOfferModel.fromJson(map);
        } else {
          return DispatchOfferModel(
            id: (map['id'] as int?) ?? 0,
            status: map['status'] as String? ?? 'assigned',
            orderId: (map['id'] as int?) ?? 0,
            order: map,
          );
        }
      }).toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> acceptOffer(int offerId) async {
    final response = await _dio.post('/api/technician/offers/$offerId/accept');
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> declineOffer(int offerId, {String? reason}) async {
    final response = await _dio.post(
      '/api/technician/offers/$offerId/decline',
      data: {
        'reason': reason ?? 'busy',
      },
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> updateLocation({
    required double currentLat,
    required double currentLng,
  }) async {
    final response = await _dio.patch(
      '/api/technician/location',
      data: {
        'current_lat': currentLat,
        'current_lng': currentLng,
      },
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> arriveOrder(int orderId, {required double lat, required double lng}) async {
    final response = await _dio.post(
      '/api/orders/$orderId/arrive',
      data: {
        'lat': lat,
        'lng': lng,
      },
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> withdrawOrder(int orderId, {String? reason}) async {
    final response = await _dio.post(
      '/api/orders/$orderId/withdraw',
      data: reason != null ? {'reason': reason} : {},
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> reportClientNoShow(int orderId) async {
    final response = await _dio.post(
      '/api/orders/$orderId/no-show/client',
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
