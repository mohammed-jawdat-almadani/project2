import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class ReportClientNoShowUseCase implements UseCase<void, int> {
  final HomeRepository _repository;

  ReportClientNoShowUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(int orderId) async {
    return _repository.reportClientNoShow(orderId);
  }
}
