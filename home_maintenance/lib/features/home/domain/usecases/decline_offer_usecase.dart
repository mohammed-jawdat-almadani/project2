import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class DeclineOfferParams {
  final int offerId;
  final String? reason;

  const DeclineOfferParams({
    required this.offerId,
    this.reason,
  });
}

@injectable
class DeclineOfferUseCase implements UseCase<void, DeclineOfferParams> {
  final HomeRepository repository;

  DeclineOfferUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeclineOfferParams params) {
    return repository.declineOffer(params.offerId, reason: params.reason);
  }
}
