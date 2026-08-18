import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/sham_cash_account.dart';
import '../../domain/entities/wallet_info.dart';
import '../../domain/entities/withdrawal_item.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../datasources/wallet_remote_data_source.dart';

@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource _remoteDataSource;

  WalletRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, WalletInfo>> getWallet() async {
    try {
      final model = await _remoteDataSource.getWallet();
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب بيانات المحفظة',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, List<WithdrawalItem>>> getWithdrawals() async {
    try {
      final models = await _remoteDataSource.getWithdrawals();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب طلبات السحب',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, WithdrawalItem>> requestWithdrawal(String amount) async {
    try {
      final model = await _remoteDataSource.requestWithdrawal(amount);
      return Right(model.toEntity());
    } on DioException catch (e) {
      final msg = e.response?.data['message']?.toString() ?? '';
      
      // Intelligent Error Translation for all cases
      if (msg.contains('minimum withdrawal is 100')) {
        return Left(ServerFailure('الحد الأدنى لطلب السحب هو 100.00 ل.س'));
      } else if (msg.contains('already have a withdrawal in progress')) {
        return Left(ServerFailure('لديك طلب سحب قيد المعالجة بالفعل. يرجى الانتظار حتى اكتماله.'));
      } else if (msg.contains('Sham Cash') || msg.contains('sham cash')) {
        return Left(ServerFailure('يرجى ربط حساب شام كاش أولاً قبل إنشاء طلب السحب'));
      } else if (msg.contains('insufficient') || msg.contains('Insufficient') || msg.contains('balance')) {
        return Left(ServerFailure('الرصيد المتاح غير كافٍ لإتمام عملية السحب'));
      } else if (msg.contains('dispute') || msg.contains('Dispute')) {
        return Left(ServerFailure('لا يمكن إنشاء طلب سحب أثناء وجود نزاع مفتوح'));
      }

      return Left(ServerFailure(
        msg.isNotEmpty ? msg : 'فشل في إنشاء طلب السحب',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, ShamCashAccount?>> getShamCashAccount() async {
    try {
      final account = await _remoteDataSource.getShamCashAccount();
      return Right(account);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في جلب حساب شام كاش',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, void>> setShamCashAccount({
    required String name,
    required String number,
  }) async {
    try {
      await _remoteDataSource.setShamCashAccount(name: name, number: number);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data['message'] ?? 'فشل في حفظ حساب شام كاش',
      ));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
