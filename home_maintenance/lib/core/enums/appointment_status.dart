enum AppointmentStatus {
  pending,
  confirmed,
  activated,
  canceled,
}

extension AppointmentStatusX on AppointmentStatus {
  String get value {
    switch (this) {
      case AppointmentStatus.pending:
        return 'pending';
      case AppointmentStatus.confirmed:
        return 'confirmed';
      case AppointmentStatus.activated:
        return 'activated';
      case AppointmentStatus.canceled:
        return 'canceled';
    }
  }

  static AppointmentStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'pending':
        return AppointmentStatus.pending;
      case 'confirmed':
        return AppointmentStatus.confirmed;
      case 'activated':
        return AppointmentStatus.activated;
      case 'canceled':
        return AppointmentStatus.canceled;
      default:
        return null;
    }
  }
}
