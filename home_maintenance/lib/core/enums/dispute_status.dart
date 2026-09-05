enum DisputeStatus {
  open,
  underReview,
  escalated,
  resolved,
}

extension DisputeStatusX on DisputeStatus {
  String get value {
    switch (this) {
      case DisputeStatus.open:
        return 'open';
      case DisputeStatus.underReview:
        return 'under_review';
      case DisputeStatus.escalated:
        return 'escalated';
      case DisputeStatus.resolved:
        return 'resolved';
    }
  }

  static DisputeStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'open':
        return DisputeStatus.open;
      case 'under_review':
        return DisputeStatus.underReview;
      case 'escalated':
        return DisputeStatus.escalated;
      case 'resolved':
        return DisputeStatus.resolved;
      default:
        return null;
    }
  }
}
