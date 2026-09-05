import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/sham_cash_account.dart';
import '../entities/wallet_info.dart';
import '../entities/withdrawal_item.dart';

abstract class WalletRepository {
  Future<Either<Failure, WalletInfo>> getWallet();
  Future<Either<Failure, List<WithdrawalItem>>> getWithdrawals();
  Future<Either<Failure, WithdrawalItem>> requestWithdrawal(String amount);
  Future<Either<Failure, ShamCashAccount?>> getShamCashAccount();
  Future<Either<Failure, void>> setShamCashAccount({
    required String name,
    required String number,
  });
}
