enum BalanceType {
  available,
  held,
}

extension BalanceTypeX on BalanceType {
  String get value {
    switch (this) {
      case BalanceType.available:
        return 'available';
      case BalanceType.held:
        return 'held';
    }
  }

  static BalanceType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'available':
        return BalanceType.available;
      case 'held':
        return BalanceType.held;
      default:
        return null;
    }
  }
}
