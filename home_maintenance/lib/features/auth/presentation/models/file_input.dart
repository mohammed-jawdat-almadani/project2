import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

enum FileValidationError { empty }

class FileInput extends FormzInput<XFile?, FileValidationError> {
  const FileInput.pure() : super.pure(null);
  const FileInput.dirty([super.value]) : super.dirty();

  @override
  FileValidationError? validator(XFile? value) {
    return value == null ? FileValidationError.empty : null;
  }
}
