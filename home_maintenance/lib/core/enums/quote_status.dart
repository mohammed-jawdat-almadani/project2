enum QuoteStatus {
  pending,
  approved,
  rejected,
  expired,
}

extension QuoteStatusX on QuoteStatus {
  String get value {
    switch (this) {
      case QuoteStatus.pending:
        return 'pending';
      case QuoteStatus.approved:
        return 'approved';
      case QuoteStatus.rejected:
        return 'rejected';
      case QuoteStatus.expired:
        return 'expired';
    }
  }

  static QuoteStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'pending':
        return QuoteStatus.pending;
      case 'approved':
        return QuoteStatus.approved;
      case 'rejected':
        return QuoteStatus.rejected;
      case 'expired':
        return QuoteStatus.expired;
      default:
        return null;
    }
  }
}
