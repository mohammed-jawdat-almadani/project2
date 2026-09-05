import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/withdrawal_item.dart';
import '../repositories/wallet_repository.dart';

@injectable
class RequestWithdrawalUseCase implements UseCase<WithdrawalItem, String> {
  final WalletRepository repository;

  RequestWithdrawalUseCase(this.repository);

  @override
  Future<Either<Failure, WithdrawalItem>> call(String amount) {
    return repository.requestWithdrawal(amount);
  }
}
