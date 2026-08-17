enum PromoAppliesTo {
  inspectionFee,
  total,
}

extension PromoAppliesToX on PromoAppliesTo {
  String get value {
    switch (this) {
      case PromoAppliesTo.inspectionFee:
        return 'inspection_fee';
      case PromoAppliesTo.total:
        return 'total';
    }
  }

  static PromoAppliesTo? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'inspection_fee':
        return PromoAppliesTo.inspectionFee;
      case 'total':
        return PromoAppliesTo.total;
      default:
        return null;
    }
  }
}
