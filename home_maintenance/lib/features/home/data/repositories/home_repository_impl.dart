import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/dispatch_offer.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, bool>> setAvailability({
    required bool isAvailable,
    double? currentLat,
    double? currentLng,
  }) async {
    try {
      final result = await _remoteDataSource.setAvailability(
        isAvailable: isAvailable,
        currentLat: currentLat,
        currentLng: currentLng,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في تحديث حالة التوافر',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, bool>> getAvailability() async {
    try {
      final result = await _remoteDataSource.getAvailability();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب حالة التوافر',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, List<DispatchOffer>>> getMyOffers() async {
    try {
      final models = await _remoteDataSource.getMyOffers();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب العروض المتاحة',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, List<DispatchOffer>>> getOrders() async {
    try {
      final models = await _remoteDataSource.getOrders();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب الطلبات',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> acceptOffer(int offerId) async {
    try {
      await _remoteDataSource.acceptOffer(offerId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في قبول الطلب',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> declineOffer(int offerId, {String? reason}) async {
    try {
      await _remoteDataSource.declineOffer(offerId, reason: reason);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في رفض الطلب',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> updateLocation({
    required double currentLat,
    required double currentLng,
  }) async {
    try {
      await _remoteDataSource.updateLocation(
        currentLat: currentLat,
        currentLng: currentLng,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في تحديث الموقع',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> arriveOrder(int orderId, {required double lat, required double lng}) async {
    try {
      await _remoteDataSource.arriveOrder(orderId, lat: lat, lng: lng);
      return const Right(null);
    } on DioException catch (e) {
      final msg = e.response?.data['message']?.toString();
      if (msg != null && msg.contains('You must be at the client location')) {
        return Left(ServerFailure('يجب أن تكون متواجداً بالقرب من موقع العميل لتسجيل الوصول 📍'));
      }
      return Left(ServerFailure(
        msg ?? 'فشل في تسجيل الوصول إلى الموقع',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> withdrawOrder(int orderId, {String? reason}) async {
    try {
      await _remoteDataSource.withdrawOrder(orderId, reason: reason);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في الانسحاب من الطلب',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
