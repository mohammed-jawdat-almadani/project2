import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdrawal_item.freezed.dart';

@freezed
abstract class WithdrawalItem with _$WithdrawalItem {
  const factory WithdrawalItem({
    required int id,
    required String amount,
    required String status, // 'processing', 'completed', 'rejected'
    String? shamCashNumber,
    String? shamCashName,
    @Default(false) bool hasReceipt,
    DateTime? createdAt,
    String? rejectionReason,
  }) = _WithdrawalItem;
}
