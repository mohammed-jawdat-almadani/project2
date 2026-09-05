import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class WithdrawOrderParams {
  final int orderId;
  final String? reason;

  WithdrawOrderParams({
    required this.orderId,
    this.reason,
  });
}

@injectable
class WithdrawOrderUseCase implements UseCase<void, WithdrawOrderParams> {
  final HomeRepository repository;

  WithdrawOrderUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(WithdrawOrderParams params) {
    return repository.withdrawOrder(
      params.orderId,
      reason: params.reason,
    );
  }
}
