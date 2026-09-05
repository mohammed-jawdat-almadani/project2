import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sham_cash_account.dart';
import '../../domain/entities/wallet_info.dart';
import '../../domain/entities/withdrawal_item.dart';

part 'wallet_state.freezed.dart';

@freezed
abstract class WalletState with _$WalletState {
  const factory WalletState({
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    WalletInfo? wallet,
    ShamCashAccount? shamCashAccount,
    @Default([]) List<WithdrawalItem> withdrawals,
    WithdrawalItem? selectedWithdrawal,
    String? errorMessage,
    String? successMessage,
  }) = _WalletState;
}
