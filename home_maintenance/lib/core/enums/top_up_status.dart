enum TopUpStatus {
  pending,
  succeeded,
  failed,
  rejected,
}

extension TopUpStatusX on TopUpStatus {
  String get value {
    switch (this) {
      case TopUpStatus.pending:
        return 'pending';
      case TopUpStatus.succeeded:
        return 'succeeded';
      case TopUpStatus.failed:
        return 'failed';
      case TopUpStatus.rejected:
        return 'rejected';
    }
  }

  static TopUpStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'pending':
        return TopUpStatus.pending;
      case 'succeeded':
        return TopUpStatus.succeeded;
      case 'failed':
        return TopUpStatus.failed;
      case 'rejected':
        return TopUpStatus.rejected;
      default:
        return null;
    }
  }
}
