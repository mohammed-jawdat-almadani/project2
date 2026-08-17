enum OrderPhotoKind {
  flaw,
  closure,
  dispute,
}

extension OrderPhotoKindX on OrderPhotoKind {
  String get value {
    switch (this) {
      case OrderPhotoKind.flaw:
        return 'flaw';
      case OrderPhotoKind.closure:
        return 'closure';
      case OrderPhotoKind.dispute:
        return 'dispute';
    }
  }

  static OrderPhotoKind? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'flaw':
        return OrderPhotoKind.flaw;
      case 'closure':
        return OrderPhotoKind.closure;
      case 'dispute':
        return OrderPhotoKind.dispute;
      default:
        return null;
    }
  }
}
