import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/sham_cash_account.dart';
import '../repositories/wallet_repository.dart';

@injectable
class GetShamCashAccountUseCase implements UseCase<ShamCashAccount?, NoParams> {
  final WalletRepository repository;

  GetShamCashAccountUseCase(this.repository);

  @override
  Future<Either<Failure, ShamCashAccount?>> call(NoParams params) {
    return repository.getShamCashAccount();
  }
}
