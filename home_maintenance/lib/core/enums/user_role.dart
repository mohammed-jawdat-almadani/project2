enum UserRole {
  client,
  technician,
  admin,
  support,
  platform,
}

extension UserRoleX on UserRole {
  String get value {
    switch (this) {
      case UserRole.client:
        return 'client';
      case UserRole.technician:
        return 'technician';
      case UserRole.admin:
        return 'admin';
      case UserRole.support:
        return 'support';
      case UserRole.platform:
        return 'platform';
    }
  }

  static UserRole? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'client':
        return UserRole.client;
      case 'technician':
        return UserRole.technician;
      case 'admin':
        return UserRole.admin;
      case 'support':
        return UserRole.support;
      case 'platform':
        return UserRole.platform;
      default:
        return null;
    }
  }
}
