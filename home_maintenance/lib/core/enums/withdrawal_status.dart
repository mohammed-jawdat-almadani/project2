enum WithdrawalStatus {
  processing,
  completed,
  rejected,
}

extension WithdrawalStatusX on WithdrawalStatus {
  String get value {
    switch (this) {
      case WithdrawalStatus.processing:
        return 'processing';
      case WithdrawalStatus.completed:
        return 'completed';
      case WithdrawalStatus.rejected:
        return 'rejected';
    }
  }

  static WithdrawalStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'processing':
        return WithdrawalStatus.processing;
      case 'completed':
        return WithdrawalStatus.completed;
      case 'rejected':
        return WithdrawalStatus.rejected;
      default:
        return null;
    }
  }
}
