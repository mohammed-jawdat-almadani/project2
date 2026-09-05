enum TechnicianFlagOutcome {
  dismissed,
  upheld,
  suspended,
  banned,
}

extension TechnicianFlagOutcomeX on TechnicianFlagOutcome {
  String get value {
    switch (this) {
      case TechnicianFlagOutcome.dismissed:
        return 'dismissed';
      case TechnicianFlagOutcome.upheld:
        return 'upheld';
      case TechnicianFlagOutcome.suspended:
        return 'suspended';
      case TechnicianFlagOutcome.banned:
        return 'banned';
    }
  }

  static TechnicianFlagOutcome? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'dismissed':
        return TechnicianFlagOutcome.dismissed;
      case 'upheld':
        return TechnicianFlagOutcome.upheld;
      case 'suspended':
        return TechnicianFlagOutcome.suspended;
      case 'banned':
        return TechnicianFlagOutcome.banned;
      default:
        return null;
    }
  }
}
