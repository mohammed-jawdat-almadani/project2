enum NotificationCategory {
  orders,
  financial,
  admin,
}

extension NotificationCategoryX on NotificationCategory {
  String get value {
    switch (this) {
      case NotificationCategory.orders:
        return 'orders';
      case NotificationCategory.financial:
        return 'financial';
      case NotificationCategory.admin:
        return 'admin';
    }
  }

  static NotificationCategory? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'orders':
        return NotificationCategory.orders;
      case 'financial':
        return NotificationCategory.financial;
      case 'admin':
        return NotificationCategory.admin;
      default:
        return null;
    }
  }
}
