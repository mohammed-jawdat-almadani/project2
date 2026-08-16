import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category_model.dart';
import '../repositories/auth_repository.dart';

@injectable
class GetCategoriesUseCase implements UseCase<List<CategoryModel>, NoParams> {
  final AuthRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParams params) {
    return repository.getCategories();
  }
}
