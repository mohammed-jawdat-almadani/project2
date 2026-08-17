enum DisputeResolution {
  fullRefund,
  partialRefund,
  releaseToTechnician,
  warrantyOrder,
}

extension DisputeResolutionX on DisputeResolution {
  String get value {
    switch (this) {
      case DisputeResolution.fullRefund:
        return 'full_refund';
      case DisputeResolution.partialRefund:
        return 'partial_refund';
      case DisputeResolution.releaseToTechnician:
        return 'release_to_technician';
      case DisputeResolution.warrantyOrder:
        return 'warranty_order';
    }
  }

  static DisputeResolution? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'full_refund':
        return DisputeResolution.fullRefund;
      case 'partial_refund':
        return DisputeResolution.partialRefund;
      case 'release_to_technician':
        return DisputeResolution.releaseToTechnician;
      case 'warranty_order':
        return DisputeResolution.warrantyOrder;
      default:
        return null;
    }
  }
}
