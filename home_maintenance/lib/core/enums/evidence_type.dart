enum EvidenceType {
  before,
  after,
  invoice,
  dispute,
}

extension EvidenceTypeX on EvidenceType {
  String get value {
    switch (this) {
      case EvidenceType.before:
        return 'before';
      case EvidenceType.after:
        return 'after';
      case EvidenceType.invoice:
        return 'invoice';
      case EvidenceType.dispute:
        return 'dispute';
    }
  }

  static EvidenceType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'before':
        return EvidenceType.before;
      case 'after':
        return EvidenceType.after;
      case 'invoice':
        return EvidenceType.invoice;
      case 'dispute':
        return EvidenceType.dispute;
      default:
        return null;
    }
  }
}
