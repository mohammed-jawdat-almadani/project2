enum QuoteType {
  initial,
  addon,
}

extension QuoteTypeX on QuoteType {
  String get value {
    switch (this) {
      case QuoteType.initial:
        return 'initial';
      case QuoteType.addon:
        return 'addon';
    }
  }

  static QuoteType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'initial':
        return QuoteType.initial;
      case 'addon':
        return QuoteType.addon;
      default:
        return null;
    }
  }
}
