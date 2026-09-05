enum SettingDataType {
  string,
  int,
  decimal,
  bool,
}

extension SettingDataTypeX on SettingDataType {
  String get value {
    switch (this) {
      case SettingDataType.string:
        return 'string';
      case SettingDataType.int:
        return 'int';
      case SettingDataType.decimal:
        return 'decimal';
      case SettingDataType.bool:
        return 'bool';
    }
  }

  static SettingDataType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'string':
        return SettingDataType.string;
      case 'int':
        return SettingDataType.int;
      case 'decimal':
        return SettingDataType.decimal;
      case 'bool':
        return SettingDataType.bool;
      default:
        return null;
    }
  }
}
