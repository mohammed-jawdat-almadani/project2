enum ProviderStatus {
  pending,
  approved,
  rejected,
  none,
}

extension ProviderStatusX on ProviderStatus {
  String get value {
    switch (this) {
      case ProviderStatus.pending:
        return 'pending';
      case ProviderStatus.approved:
        return 'approved';
      case ProviderStatus.rejected:
        return 'rejected';
      case ProviderStatus.none:
        return 'none';
    }
  }

  static ProviderStatus fromValue(String? value) {
    if (value == 'approved' || value == 'active') return ProviderStatus.approved;
    if (value == 'pending') return ProviderStatus.pending;
    if (value == 'rejected') return ProviderStatus.rejected;
    return ProviderStatus.none; // default
  }
}
