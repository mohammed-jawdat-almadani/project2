enum TechnicianStatus {
  pending,
  probation,
  active,
  banned,
}

extension TechnicianStatusX on TechnicianStatus {
  String get value {
    switch (this) {
      case TechnicianStatus.pending:
        return 'pending';
      case TechnicianStatus.probation:
        return 'probation';
      case TechnicianStatus.active:
        return 'active';
      case TechnicianStatus.banned:
        return 'banned';
    }
  }

  static TechnicianStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'pending':
        return TechnicianStatus.pending;
      case 'probation':
        return TechnicianStatus.probation;
      case 'active':
        return TechnicianStatus.active;
      case 'banned':
        return TechnicianStatus.banned;
      default:
        return null;
    }
  }
}
