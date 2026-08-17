enum UserRole {
  user,
  provider,
}

extension UserRoleX on UserRole {
  String get value {
    switch (this) {
      case UserRole.user:
        return 'user';
      case UserRole.provider:
        return 'provider';
    }
  }

  static UserRole fromValue(String? value) {
    if (value == 'provider' || value == 'technician') return UserRole.provider;
    return UserRole.user; // default
  }
}
