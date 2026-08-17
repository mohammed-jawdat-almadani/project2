enum DispatchOfferStatus {
  offered,
  accepted,
  rejected,
  expired,
}

extension DispatchOfferStatusX on DispatchOfferStatus {
  String get value {
    switch (this) {
      case DispatchOfferStatus.offered:
        return 'offered';
      case DispatchOfferStatus.accepted:
        return 'accepted';
      case DispatchOfferStatus.rejected:
        return 'rejected';
      case DispatchOfferStatus.expired:
        return 'expired';
    }
  }

  static DispatchOfferStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'offered':
        return DispatchOfferStatus.offered;
      case 'accepted':
        return DispatchOfferStatus.accepted;
      case 'rejected':
        return DispatchOfferStatus.rejected;
      case 'expired':
        return DispatchOfferStatus.expired;
      default:
        return null;
    }
  }
}
