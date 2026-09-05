import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_event.freezed.dart';

@freezed
abstract class WalletEvent with _$WalletEvent {
  const factory WalletEvent.init() = _Init;
  const factory WalletEvent.refresh() = _Refresh;
  const factory WalletEvent.requestWithdrawal(String amount) = _RequestWithdrawal;
  const factory WalletEvent.setShamCashAccount({
    required String name,
    required String number,
  }) = _SetShamCashAccount;
  const factory WalletEvent.selectWithdrawal(int id) = _SelectWithdrawal;
}
