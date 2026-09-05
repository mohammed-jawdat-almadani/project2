import 'package:freezed_annotation/freezed_annotation.dart';

part 'sham_cash_account.freezed.dart';

@freezed
abstract class ShamCashAccount with _$ShamCashAccount {
  const factory ShamCashAccount({
    required String name,
    required String number,
    @Default(true) bool isLinked,
  }) = _ShamCashAccount;
}
