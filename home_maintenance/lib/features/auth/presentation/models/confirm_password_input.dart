import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { empty, mismatch }

class ConfirmPasswordInput extends FormzInput<String, ConfirmPasswordValidationError> {
  final String originalPassword;

  const ConfirmPasswordInput.pure({this.originalPassword = ''}) : super.pure('');
  const ConfirmPasswordInput.dirty({required this.originalPassword, String value = ''}) : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) return ConfirmPasswordValidationError.empty;
    if (value != originalPassword) return ConfirmPasswordValidationError.mismatch;
    return null;
  }
}
