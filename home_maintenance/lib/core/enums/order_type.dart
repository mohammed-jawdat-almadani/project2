enum OrderType {
  urgent,
  scheduled,
}

extension OrderTypeX on OrderType {
  String get value {
    switch (this) {
      case OrderType.urgent:
        return 'urgent';
      case OrderType.scheduled:
        return 'scheduled';
    }
  }

  static OrderType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'urgent':
        return OrderType.urgent;
      case 'scheduled':
        return OrderType.scheduled;
      default:
        return null;
    }
  }
}
