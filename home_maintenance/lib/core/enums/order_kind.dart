enum OrderKind {
  normal,
  warranty,
  addon,
}

extension OrderKindX on OrderKind {
  String get value {
    switch (this) {
      case OrderKind.normal:
        return 'normal';
      case OrderKind.warranty:
        return 'warranty';
      case OrderKind.addon:
        return 'addon';
    }
  }

  static OrderKind? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'normal':
        return OrderKind.normal;
      case 'warranty':
        return OrderKind.warranty;
      case 'addon':
        return OrderKind.addon;
      default:
        return null;
    }
  }
}
