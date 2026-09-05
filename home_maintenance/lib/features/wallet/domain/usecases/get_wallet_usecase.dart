import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/wallet_info.dart';
import '../repositories/wallet_repository.dart';

@injectable
class GetWalletUseCase implements UseCase<WalletInfo, NoParams> {
  final WalletRepository repository;

  GetWalletUseCase(this.repository);

  @override
  Future<Either<Failure, WalletInfo>> call(NoParams params) {
    return repository.getWallet();
  }
}
