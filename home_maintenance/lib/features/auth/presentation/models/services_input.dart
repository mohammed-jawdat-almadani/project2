import 'package:formz/formz.dart';
import '../../domain/entities/category_model.dart';

enum ServicesValidationError { empty }

class ServicesInput extends FormzInput<List<CategoryModel>, ServicesValidationError> {
  const ServicesInput.pure() : super.pure(const <CategoryModel>[]);
  const ServicesInput.dirty([super.value = const <CategoryModel>[]]) : super.dirty();

  @override
  ServicesValidationError? validator(List<CategoryModel> value) {
    return value.isEmpty ? ServicesValidationError.empty : null;
  }
}
