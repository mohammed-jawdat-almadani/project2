import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/domain/entities/category_model.dart';
import '../../domain/entities/quote_part.dart';
import '../models/order_item_model.dart';
import '../models/order_quote_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderItemModel>> getOrders({String? status});
  Future<OrderItemModel> getOrderDetails(int orderId);
  Future<List<CategoryModel>> getCategories();
  Future<OrderQuoteModel> sendQuote({
    required int orderId,
    required String laborCost,
    required int warrantyDays,
    required List<QuotePart> parts,
  });
  Future<OrderQuoteModel> sendAddonQuote({
    required int orderId,
    required String laborCost,
    required List<QuotePart> parts,
  });
  Future<List<OrderQuoteModel>> getQuotes(int orderId);
  Future<void> requestWaitingForParts({
    required int orderId,
    required String note,
  });
  Future<void> resumeOrder(int orderId);
  Future<String> requestClosure({
    required int orderId,
    required List<File> photos,
  });
  Future<OrderItemModel> verifyClosure({
    required int orderId,
    required String code,
  });
}

@LazySingleton(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final Dio _dio;

  OrdersRemoteDataSourceImpl(this._dio);

  @override
  Future<List<OrderItemModel>> getOrders({String? status}) async {
    final queryParams = <String, dynamic>{};
    if (status != null && status.isNotEmpty && status != 'all') {
      queryParams['status'] = status;
    }

    final response = await _dio.get(
      '/api/orders',
      queryParameters: queryParams,
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data['data'] as List<dynamic>?) ?? [];
      return data
          .map((json) => OrderItemModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<OrderItemModel> getOrderDetails(int orderId) async {
    final response = await _dio.get('/api/orders/$orderId');

    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>;
      return OrderItemModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get('/api/categories');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'] as List<dynamic>;
      return data
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<OrderQuoteModel> sendQuote({
    required int orderId,
    required String laborCost,
    required int warrantyDays,
    required List<QuotePart> parts,
  }) async {
    final hasImages = parts.any((p) => p.localImage != null);

    Response response;
    if (!hasImages) {
      final jsonBody = {
        'labor_cost': laborCost,
        'warranty_days': warrantyDays,
        'parts': parts.map((p) => {
          'name': p.name,
          'price': p.price,
          'classification': p.classification,
        }).toList(),
      };
      response = await _dio.post(
        '/api/orders/$orderId/quotes',
        data: jsonBody,
      );
    } else {
      final formDataMap = <String, dynamic>{
        'labor_cost': laborCost,
        'warranty_days': warrantyDays.toString(),
      };

      for (int i = 0; i < parts.length; i++) {
        final p = parts[i];
        formDataMap['parts[$i][name]'] = p.name;
        formDataMap['parts[$i][price]'] = p.price;
        formDataMap['parts[$i][classification]'] = p.classification;
        if (p.localImage != null) {
          formDataMap['parts[$i][image]'] = await MultipartFile.fromFile(
            p.localImage!.path,
            filename: 'part_$i.jpg',
          );
        }
      }

      final formData = FormData.fromMap(formDataMap);
      response = await _dio.post(
        '/api/orders/$orderId/quotes',
        data: formData,
      );
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data['data'] as Map<String, dynamic>;
      return OrderQuoteModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<OrderQuoteModel> sendAddonQuote({
    required int orderId,
    required String laborCost,
    required List<QuotePart> parts,
  }) async {
    final hasImages = parts.any((p) => p.localImage != null);

    Response response;
    if (!hasImages) {
      final jsonBody = {
        'labor_cost': laborCost,
        'parts': parts.map((p) => {
          'name': p.name,
          'price': p.price,
          'classification': p.classification,
        }).toList(),
      };
      response = await _dio.post(
        '/api/orders/$orderId/quotes/addon',
        data: jsonBody,
      );
    } else {
      final formDataMap = <String, dynamic>{
        'labor_cost': laborCost,
      };

      for (int i = 0; i < parts.length; i++) {
        final p = parts[i];
        formDataMap['parts[$i][name]'] = p.name;
        formDataMap['parts[$i][price]'] = p.price;
        formDataMap['parts[$i][classification]'] = p.classification;
        if (p.localImage != null) {
          formDataMap['parts[$i][image]'] = await MultipartFile.fromFile(
            p.localImage!.path,
            filename: 'addon_part_$i.jpg',
          );
        }
      }

      final formData = FormData.fromMap(formDataMap);
      response = await _dio.post(
        '/api/orders/$orderId/quotes/addon',
        data: formData,
      );
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data['data'] as Map<String, dynamic>;
      return OrderQuoteModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<OrderQuoteModel>> getQuotes(int orderId) async {
    final response = await _dio.get('/api/orders/$orderId/quotes');
    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data['data'] as List<dynamic>?) ?? [];
      return data
          .map((json) => OrderQuoteModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> requestWaitingForParts({
    required int orderId,
    required String note,
  }) async {
    final response = await _dio.post(
      '/api/orders/$orderId/waiting-for-parts',
      data: {
        'note': note,
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
  Future<void> resumeOrder(int orderId) async {
    final response = await _dio.post('/api/orders/$orderId/resume');
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<String> requestClosure({
    required int orderId,
    required List<File> photos,
  }) async {
    final multipartFiles = <MultipartFile>[];

    for (int i = 0; i < photos.length; i++) {
      multipartFiles.add(
        await MultipartFile.fromFile(photos[i].path, filename: 'closure_$i.jpg'),
      );
    }

    final formData = FormData.fromMap({
      'photos[]': multipartFiles,
    });

    final response = await _dio.post(
      '/api/orders/$orderId/closure/request',
      data: formData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['message']?.toString() ?? 'تم إرسال كود الإغلاق للعميل';
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<OrderItemModel> verifyClosure({
    required int orderId,
    required String code,
  }) async {
    final response = await _dio.post(
      '/api/orders/$orderId/closure/verify',
      data: {
        'code': code,
      },
    );

    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>;
      return OrderItemModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
