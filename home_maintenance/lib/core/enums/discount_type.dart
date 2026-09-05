enum DiscountType {
  percentage,
  fixed,
}

extension DiscountTypeX on DiscountType {
  String get value {
    switch (this) {
      case DiscountType.percentage:
        return 'percentage';
      case DiscountType.fixed:
        return 'fixed';
    }
  }

  static DiscountType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'percentage':
        return DiscountType.percentage;
      case 'fixed':
        return DiscountType.fixed;
      default:
        return null;
    }
  }
}
