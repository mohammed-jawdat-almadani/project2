import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/wallet_info_model.dart';
import '../models/withdrawal_item_model.dart';
import '../../domain/entities/sham_cash_account.dart';

abstract class WalletRemoteDataSource {
  Future<WalletInfoModel> getWallet();
  Future<List<WithdrawalItemModel>> getWithdrawals();
  Future<WithdrawalItemModel> requestWithdrawal(String amount);
  Future<ShamCashAccount?> getShamCashAccount();
  Future<void> setShamCashAccount({
    required String name,
    required String number,
  });
}

@LazySingleton(as: WalletRemoteDataSource)
class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final Dio _dio;

  WalletRemoteDataSourceImpl(this._dio);

  @override
  Future<WalletInfoModel> getWallet() async {
    final response = await _dio.get('/api/wallet');
    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>;
      return WalletInfoModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<WithdrawalItemModel>> getWithdrawals() async {
    final response = await _dio.get('/api/technician/withdrawals');
    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data['data'] as List<dynamic>?) ?? [];
      return data
          .map((json) => WithdrawalItemModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<WithdrawalItemModel> requestWithdrawal(String amount) async {
    final response = await _dio.post(
      '/api/technician/withdrawals',
      data: {
        'amount': amount,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data['data'] as Map<String, dynamic>;
      return WithdrawalItemModel.fromJson(data);
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<ShamCashAccount?> getShamCashAccount() async {
    final response = await _dio.get('/api/technician/me');
    if (response.statusCode == 200) {
      final data = response.data['data'] as Map<String, dynamic>?;
      if (data == null) return null;

      final hasAccount = (data['has_sham_cash_account'] as bool?) ?? false;
      final name = data['sham_cash_name']?.toString();
      final last4 = data['sham_cash_last4']?.toString();
      final fullNumber = data['sham_cash_number']?.toString();

      final resolvedNumber = (fullNumber != null && fullNumber.isNotEmpty)
          ? fullNumber
          : (last4 != null && last4.isNotEmpty ? last4 : null);

      if (hasAccount || (name != null && name.isNotEmpty && resolvedNumber != null)) {
        return ShamCashAccount(
          name: name ?? 'فني الصيانة',
          number: resolvedNumber ?? '',
          isLinked: true,
        );
      }
      return null;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> setShamCashAccount({
    required String name,
    required String number,
  }) async {
    final response = await _dio.put(
      '/api/technician/sham-cash-account',
      data: {
        'sham_cash_name': name,
        'sham_cash_number': number,
      },
    );
    if (response.statusCode != 200 && response.statusCode != 204 && response.statusCode != 201) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
