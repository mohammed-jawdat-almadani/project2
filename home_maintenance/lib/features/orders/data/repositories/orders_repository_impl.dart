import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/order_quote.dart';
import '../../domain/entities/quote_part.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasources/orders_remote_data_source.dart';

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource _remoteDataSource;

  OrdersRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OrderItem>>> getOrders({String? status}) async {
    try {
      final models = await _remoteDataSource.getOrders(status: status);
      final categories = await _remoteDataSource.getCategories();
      final categoryMap = {for (final c in categories) c.id: c.name};

      final entities = await Future.wait<OrderItem>(models.map((m) async {
        var entity = m.toEntity(categoryNameMap: categoryMap);
        if (entity.arrivedAt != null &&
            (entity.status.toLowerCase() == 'accepted' || entity.status.toLowerCase() == 'arrived')) {
          try {
            final quotes = await _remoteDataSource.getQuotes(entity.id);
            if (quotes.isNotEmpty) {
              final hasPending = quotes.any((q) => q.status.toLowerCase() == 'pending');
              final hasApproved = quotes.any((q) =>
                  q.status.toLowerCase() == 'accepted' || q.status.toLowerCase() == 'approved');
              final hasRejected = quotes.any((q) => q.status.toLowerCase() == 'rejected');
              if (hasPending) {
                entity = entity.copyWith(status: 'quote_pending');
              } else if (hasApproved) {
                entity = entity.copyWith(status: 'in_progress');
              } else if (hasRejected) {
                entity = entity.copyWith(status: 'quote_rejected');
              }
            }
          } catch (_) {}
        }
        return entity;
      }));

      return Right(entities);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب قائمة الطلبات',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, OrderItem>> getOrderDetails(int orderId) async {
    try {
      final model = await _remoteDataSource.getOrderDetails(orderId);
      final categories = await _remoteDataSource.getCategories();
      final categoryMap = {for (final c in categories) c.id: c.name};

      var entity = model.toEntity(categoryNameMap: categoryMap);
      if (entity.arrivedAt != null &&
          (entity.status.toLowerCase() == 'accepted' || entity.status.toLowerCase() == 'arrived')) {
        try {
          final quotes = await _remoteDataSource.getQuotes(orderId);
          if (quotes.isNotEmpty) {
            final hasPending = quotes.any((q) => q.status.toLowerCase() == 'pending');
            final hasApproved = quotes.any((q) =>
                q.status.toLowerCase() == 'accepted' || q.status.toLowerCase() == 'approved');
            final hasRejected = quotes.any((q) => q.status.toLowerCase() == 'rejected');
            if (hasPending) {
              entity = entity.copyWith(status: 'quote_pending');
            } else if (hasApproved) {
              entity = entity.copyWith(status: 'in_progress');
            } else if (hasRejected) {
              entity = entity.copyWith(status: 'quote_rejected');
            }
          }
        } catch (_) {}
      }

      return Right(entity);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب تفاصيل الطلب',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, OrderQuote>> sendQuote({
    required int orderId,
    required String laborCost,
    required int warrantyDays,
    required List<QuotePart> parts,
  }) async {
    try {
      final model = await _remoteDataSource.sendQuote(
        orderId: orderId,
        laborCost: laborCost,
        warrantyDays: warrantyDays,
        parts: parts,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      String msg = e.response?.data['message']?.toString() ?? 'فشل في إرسال عرض السعر';
      if (msg.contains('parts field must be present') || msg.contains('parts field is required')) {
        msg = 'يرجى التأكد من تفاصيل قطع الغيار';
      }
      return Left(ServerFailure(msg));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء إرسال عرض السعر'));
    }
  }

  @override
  Future<Either<Failure, OrderQuote>> sendAddonQuote({
    required int orderId,
    required String laborCost,
    required List<QuotePart> parts,
  }) async {
    try {
      final model = await _remoteDataSource.sendAddonQuote(
        orderId: orderId,
        laborCost: laborCost,
        parts: parts,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      final msg = e.response?.data['message']?.toString();
      if (msg != null && msg.contains('only allowed while the repair is in progress')) {
        return Left(ServerFailure('لا يمكن إرسال عرض إضافي إلا بعد موافقة العميل وبدء العمل 🛠️'));
      }
      return Left(ServerFailure(msg ?? 'فشل في إرسال العرض الإضافي'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء إرسال العرض الإضافي'));
    }
  }

  @override
  Future<Either<Failure, List<OrderQuote>>> getQuotes(int orderId) async {
    try {
      final models = await _remoteDataSource.getQuotes(orderId);
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب عروض الأسعار',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> requestWaitingForParts({
    required int orderId,
    required String note,
  }) async {
    try {
      await _remoteDataSource.requestWaitingForParts(orderId: orderId, note: note);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في إرسال طلب الانتظار للقطعة',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> resumeOrder(int orderId) async {
    try {
      await _remoteDataSource.resumeOrder(orderId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في استئناف العمل على الطلب',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, String>> requestClosure({
    required int orderId,
    required List<File> photos,
  }) async {
    try {
      final msg = await _remoteDataSource.requestClosure(orderId: orderId, photos: photos);
      return Right(msg);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في إرسال طلب إغلاق العمل',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء طلب الإغلاق'));
    }
  }

  @override
  Future<Either<Failure, OrderItem>> verifyClosure({
    required int orderId,
    required String code,
  }) async {
    try {
      final model = await _remoteDataSource.verifyClosure(orderId: orderId, code: code);
      final categories = await _remoteDataSource.getCategories();
      final categoryMap = {for (final c in categories) c.id: c.name};
      return Right(model.toEntity(categoryNameMap: categoryMap));
    } on DioException catch (e) {
      final msg = e.response?.data['message']?.toString();
      if (msg != null && (msg.contains('invalid') || msg.contains('code'))) {
        return Left(ServerFailure('كود الإغلاق المدخل غير صحيح، يرجى التأكد من العميل ❌'));
      }
      return Left(ServerFailure(msg ?? 'فشل في التحقق من كود الإغلاق'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ أثناء التحقق من كود الإغلاق'));
    }
  }
}
