import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/wallet_repository.dart';

class SetShamCashParams {
  final String name;
  final String number;

  SetShamCashParams({required this.name, required this.number});
}

@injectable
class SetShamCashAccountUseCase implements UseCase<void, SetShamCashParams> {
  final WalletRepository repository;

  SetShamCashAccountUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SetShamCashParams params) {
    return repository.setShamCashAccount(
      name: params.name,
      number: params.number,
    );
  }
}
