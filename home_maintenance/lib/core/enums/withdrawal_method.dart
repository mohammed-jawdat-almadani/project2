enum WithdrawalMethod {
  bankAccount,
  transfer,
}

extension WithdrawalMethodX on WithdrawalMethod {
  String get value {
    switch (this) {
      case WithdrawalMethod.bankAccount:
        return 'bank_account';
      case WithdrawalMethod.transfer:
        return 'transfer';
    }
  }

  static WithdrawalMethod? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'bank_account':
        return WithdrawalMethod.bankAccount;
      case 'transfer':
        return WithdrawalMethod.transfer;
      default:
        return null;
    }
  }
}
