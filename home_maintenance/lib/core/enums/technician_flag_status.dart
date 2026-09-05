enum TechnicianFlagStatus {
  open,
  reviewed,
}

extension TechnicianFlagStatusX on TechnicianFlagStatus {
  String get value {
    switch (this) {
      case TechnicianFlagStatus.open:
        return 'open';
      case TechnicianFlagStatus.reviewed:
        return 'reviewed';
    }
  }

  static TechnicianFlagStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'open':
        return TechnicianFlagStatus.open;
      case 'reviewed':
        return TechnicianFlagStatus.reviewed;
      default:
        return null;
    }
  }
}
