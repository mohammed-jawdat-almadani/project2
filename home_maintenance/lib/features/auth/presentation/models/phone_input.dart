import 'package:formz/formz.dart';

enum PhoneValidationError { empty, invalid }

class PhoneInput extends FormzInput<String, PhoneValidationError> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([super.value = '']) : super.dirty();

  @override
  PhoneValidationError? validator(String value) {
    if (value.isEmpty) return PhoneValidationError.empty;
    if (!RegExp(r'^9\d{8}$').hasMatch(value)) return PhoneValidationError.invalid;
    return null;
  }
}
