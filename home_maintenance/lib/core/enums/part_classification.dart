enum PartClassification {
  standard,
  premium,
}

extension PartClassificationX on PartClassification {
  String get value {
    switch (this) {
      case PartClassification.standard:
        return 'standard';
      case PartClassification.premium:
        return 'premium';
    }
  }

  static PartClassification? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'standard':
        return PartClassification.standard;
      case 'premium':
        return PartClassification.premium;
      default:
        return null;
    }
  }
}
