enum PaymentStatus {
  pending,
  held,
  released,
  refunded,
  partiallyRefunded,
  processing,
}

extension PaymentStatusX on PaymentStatus {
  String get value {
    switch (this) {
      case PaymentStatus.pending:
        return 'pending';
      case PaymentStatus.held:
        return 'held';
      case PaymentStatus.released:
        return 'released';
      case PaymentStatus.refunded:
        return 'refunded';
      case PaymentStatus.partiallyRefunded:
        return 'partially_refunded';
      case PaymentStatus.processing:
        return 'processing';
    }
  }

  static PaymentStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'pending':
        return PaymentStatus.pending;
      case 'held':
        return PaymentStatus.held;
      case 'released':
        return PaymentStatus.released;
      case 'refunded':
        return PaymentStatus.refunded;
      case 'partially_refunded':
        return PaymentStatus.partiallyRefunded;
      case 'processing':
        return PaymentStatus.processing;
      default:
        return null;
    }
  }
}
