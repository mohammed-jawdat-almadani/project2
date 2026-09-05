import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/dispatch_offer.dart';

abstract class HomeRepository {
  Future<Either<Failure, bool>> setAvailability({
    required bool isAvailable,
    double? currentLat,
    double? currentLng,
  });

  Future<Either<Failure, bool>> getAvailability();

  Future<Either<Failure, List<DispatchOffer>>> getMyOffers();

  Future<Either<Failure, List<DispatchOffer>>> getOrders();

  Future<Either<Failure, void>> acceptOffer(int offerId);

  Future<Either<Failure, void>> declineOffer(int offerId, {String? reason});

  Future<Either<Failure, void>> updateLocation({
    required double currentLat,
    required double currentLng,
  });

  Future<Either<Failure, void>> arriveOrder(int orderId, {required double lat, required double lng});

  Future<Either<Failure, void>> withdrawOrder(int orderId, {String? reason});

  Future<Either<Failure, void>> reportClientNoShow(int orderId);
}
