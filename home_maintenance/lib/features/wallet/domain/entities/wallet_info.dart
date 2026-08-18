import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_info.freezed.dart';

@freezed
abstract class WalletInfo with _$WalletInfo {
  const factory WalletInfo({
    @Default('0.00') String availableBalance,
    @Default('0.00') String heldBalance,
    @Default('SYP') String currency,
  }) = _WalletInfo;
}
