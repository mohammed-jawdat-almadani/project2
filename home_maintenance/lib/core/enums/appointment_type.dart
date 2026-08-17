enum AppointmentType {
  inspection,
  repair,
  followup,
}

extension AppointmentTypeX on AppointmentType {
  String get value {
    switch (this) {
      case AppointmentType.inspection:
        return 'inspection';
      case AppointmentType.repair:
        return 'repair';
      case AppointmentType.followup:
        return 'followup';
    }
  }

  static AppointmentType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'inspection':
        return AppointmentType.inspection;
      case 'repair':
        return AppointmentType.repair;
      case 'followup':
        return AppointmentType.followup;
      default:
        return null;
    }
  }
}
