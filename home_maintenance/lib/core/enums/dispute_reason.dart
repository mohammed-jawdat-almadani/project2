enum DisputeReason {
  faultReturned,
  homeDamage,
  differentPart,
  other,
}

extension DisputeReasonX on DisputeReason {
  String get value {
    switch (this) {
      case DisputeReason.faultReturned:
        return 'fault_returned';
      case DisputeReason.homeDamage:
        return 'home_damage';
      case DisputeReason.differentPart:
        return 'different_part';
      case DisputeReason.other:
        return 'other';
    }
  }

  static DisputeReason? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'fault_returned':
        return DisputeReason.faultReturned;
      case 'home_damage':
        return DisputeReason.homeDamage;
      case 'different_part':
        return DisputeReason.differentPart;
      case 'other':
        return DisputeReason.other;
      default:
        return null;
    }
  }
}
