import 'package:formz/formz.dart';

enum TermsValidationError { notAccepted }

class TermsInput extends FormzInput<bool, TermsValidationError> {
  const TermsInput.pure() : super.pure(false);
  const TermsInput.dirty([super.value = false]) : super.dirty();

  @override
  TermsValidationError? validator(bool value) {
    return value ? null : TermsValidationError.notAccepted;
  }
}
