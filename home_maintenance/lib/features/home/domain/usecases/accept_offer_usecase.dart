import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

@injectable
class AcceptOfferUseCase implements UseCase<void, int> {
  final HomeRepository repository;

  AcceptOfferUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int offerId) {
    return repository.acceptOffer(offerId);
  }
}
