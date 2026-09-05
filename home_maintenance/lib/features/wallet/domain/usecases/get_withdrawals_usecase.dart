import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/withdrawal_item.dart';
import '../repositories/wallet_repository.dart';

@injectable
class GetWithdrawalsUseCase implements UseCase<List<WithdrawalItem>, NoParams> {
  final WalletRepository repository;

  GetWithdrawalsUseCase(this.repository);

  @override
  Future<Either<Failure, List<WithdrawalItem>>> call(NoParams params) {
    return repository.getWithdrawals();
  }
}
