import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/wallet_info.dart';

part 'wallet_info_model.freezed.dart';
part 'wallet_info_model.g.dart';

@freezed
abstract class WalletInfoModel with _$WalletInfoModel {
  const WalletInfoModel._();

  const factory WalletInfoModel({
    @JsonKey(name: 'available_balance') @Default('0.00') dynamic availableBalance,
    @JsonKey(name: 'held_balance') @Default('0.00') dynamic heldBalance,
    @Default('SYP') String currency,
  }) = _WalletInfoModel;

  factory WalletInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WalletInfoModelFromJson(json);

  WalletInfo toEntity() {
    return WalletInfo(
      availableBalance: availableBalance?.toString() ?? '0.00',
      heldBalance: heldBalance?.toString() ?? '0.00',
      currency: currency.isNotEmpty ? currency : 'SYP',
    );
  }
}
