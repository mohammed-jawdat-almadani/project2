import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/dispatch_offer.dart';
import '../repositories/home_repository.dart';

@injectable
class GetOffersUseCase implements UseCase<List<DispatchOffer>, NoParams> {
  final HomeRepository repository;

  GetOffersUseCase(this.repository);

  @override
  Future<Either<Failure, List<DispatchOffer>>> call(NoParams params) {
    return repository.getMyOffers();
  }
}
