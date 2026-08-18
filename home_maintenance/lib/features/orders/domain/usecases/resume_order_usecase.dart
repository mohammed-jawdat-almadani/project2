import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/orders_repository.dart';

@injectable
class ResumeOrderUseCase implements UseCase<void, int> {
  final OrdersRepository repository;

  ResumeOrderUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int orderId) {
    return repository.resumeOrder(orderId);
  }
}
