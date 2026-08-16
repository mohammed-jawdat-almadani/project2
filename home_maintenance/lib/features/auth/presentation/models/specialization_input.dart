import 'package:formz/formz.dart';
import '../../domain/entities/category_model.dart';

enum SpecializationValidationError { empty }

class SpecializationInput extends FormzInput<CategoryModel?, SpecializationValidationError> {
  const SpecializationInput.pure() : super.pure(null);
  const SpecializationInput.dirty([super.value]) : super.dirty();

  @override
  SpecializationValidationError? validator(CategoryModel? value) {
    return value == null ? SpecializationValidationError.empty : null;
  }
}
