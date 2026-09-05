import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/orders_repository.dart';

class RequestClosureParams {
  final int orderId;
  final List<File> photos;

  RequestClosureParams({required this.orderId, required this.photos});
}

@injectable
class RequestClosureUseCase implements UseCase<String, RequestClosureParams> {
  final OrdersRepository repository;

  RequestClosureUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(RequestClosureParams params) {
    return repository.requestClosure(
      orderId: params.orderId,
      photos: params.photos,
    );
  }
}
