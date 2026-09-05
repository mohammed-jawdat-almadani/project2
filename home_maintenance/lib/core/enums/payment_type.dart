enum PaymentType {
  inspection,
  repair,
  addon,
}

extension PaymentTypeX on PaymentType {
  String get value {
    switch (this) {
      case PaymentType.inspection:
        return 'inspection';
      case PaymentType.repair:
        return 'repair';
      case PaymentType.addon:
        return 'addon';
    }
  }

  static PaymentType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'inspection':
        return PaymentType.inspection;
      case 'repair':
        return PaymentType.repair;
      case 'addon':
        return PaymentType.addon;
      default:
        return null;
    }
  }
}
