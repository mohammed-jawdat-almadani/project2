enum TxnType {
  deposit,
  hold,
  release,
  refund,
  commission,
  payout,
  withdrawal,
  reversal,
}

extension TxnTypeX on TxnType {
  String get value {
    switch (this) {
      case TxnType.deposit:
        return 'deposit';
      case TxnType.hold:
        return 'hold';
      case TxnType.release:
        return 'release';
      case TxnType.refund:
        return 'refund';
      case TxnType.commission:
        return 'commission';
      case TxnType.payout:
        return 'payout';
      case TxnType.withdrawal:
        return 'withdrawal';
      case TxnType.reversal:
        return 'reversal';
    }
  }

  static TxnType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'deposit':
        return TxnType.deposit;
      case 'hold':
        return TxnType.hold;
      case 'release':
        return TxnType.release;
      case 'refund':
        return TxnType.refund;
      case 'commission':
        return TxnType.commission;
      case 'payout':
        return TxnType.payout;
      case 'withdrawal':
        return TxnType.withdrawal;
      case 'reversal':
        return TxnType.reversal;
      default:
        return null;
    }
  }
}
