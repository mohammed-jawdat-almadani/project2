enum TechnicianFlagReason {
  noShow,
  clientNoShow,
  withdrawal,
  partsDelay,
}

extension TechnicianFlagReasonX on TechnicianFlagReason {
  String get value {
    switch (this) {
      case TechnicianFlagReason.noShow:
        return 'no_show';
      case TechnicianFlagReason.clientNoShow:
        return 'client_no_show';
      case TechnicianFlagReason.withdrawal:
        return 'withdrawal';
      case TechnicianFlagReason.partsDelay:
        return 'parts_delay';
    }
  }

  static TechnicianFlagReason? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'no_show':
        return TechnicianFlagReason.noShow;
      case 'client_no_show':
        return TechnicianFlagReason.clientNoShow;
      case 'withdrawal':
        return TechnicianFlagReason.withdrawal;
      case 'parts_delay':
        return TechnicianFlagReason.partsDelay;
      default:
        return null;
    }
  }
}
