import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/withdrawal_item.dart';

part 'withdrawal_item_model.freezed.dart';
part 'withdrawal_item_model.g.dart';

@freezed
abstract class WithdrawalItemModel with _$WithdrawalItemModel {
  const WithdrawalItemModel._();

  const factory WithdrawalItemModel({
    required int id,
    dynamic amount,
    @Default('processing') String status,
    @JsonKey(name: 'sham_cash_number') String? shamCashNumber,
    @JsonKey(name: 'sham_cash_name') String? shamCashName,
    @JsonKey(name: 'has_receipt') @Default(false) bool hasReceipt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
  }) = _WithdrawalItemModel;

  factory WithdrawalItemModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalItemModelFromJson(json);

  WithdrawalItem toEntity() {
    return WithdrawalItem(
      id: id,
      amount: amount?.toString() ?? '0.00',
      status: status,
      shamCashNumber: shamCashNumber,
      shamCashName: shamCashName,
      hasReceipt: hasReceipt,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      rejectionReason: rejectionReason,
    );
  }
}
