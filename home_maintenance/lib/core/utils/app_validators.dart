class AppValidators {
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    // Exactly 9 digits and starts with 9
    final regex = RegExp(r'^9[0-9]{8}$');
    if (!regex.hasMatch(value)) {
      return 'رقم الهاتف يجب أن يتكون من 9 أرقام ويبدأ بـ 9';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن لا تقل عن 8 أحرف';
    }
    // Must contain letters, numbers, and symbols
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasNumber = RegExp(r'\d').hasMatch(value);
    final hasSymbol = RegExp(r'[!@#\$&*~%]').hasMatch(value);
    
    if (!hasLetter || !hasNumber || !hasSymbol) {
      return 'يجب أن تحتوي على أحرف وأرقام ورموز';
    }
    return null;
  }
}
