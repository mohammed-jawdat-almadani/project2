import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tooShort, tooWeak }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 8) return PasswordValidationError.tooShort;
    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[^a-zA-Z\d]).{8,}$').hasMatch(value)) {
      return PasswordValidationError.tooWeak;
    }
    return null;
  }
}
