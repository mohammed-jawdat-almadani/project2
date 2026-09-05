import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enums/notification_category.dart';
import '../../../../core/notifications/notification_action_handler.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/sham_cash_account.dart';
import '../../domain/entities/withdrawal_item.dart';
import '../../domain/usecases/get_wallet_usecase.dart';
import '../../domain/usecases/get_withdrawals_usecase.dart';
import '../../domain/usecases/request_withdrawal_usecase.dart';
import '../../domain/usecases/get_sham_cash_account_usecase.dart';
import '../../domain/usecases/set_sham_cash_account_usecase.dart';
import 'wallet_event.dart';
import 'wallet_state.dart';

@injectable
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final GetWalletUseCase _getWalletUseCase;
  final GetWithdrawalsUseCase _getWithdrawalsUseCase;
  final RequestWithdrawalUseCase _requestWithdrawalUseCase;
  final GetShamCashAccountUseCase _getShamCashAccountUseCase;
  final SetShamCashAccountUseCase _setShamCashAccountUseCase;
  final NotificationActionHandler _notificationHandler;

  StreamSubscription? _notificationSubscription;

  WalletBloc(
    this._getWalletUseCase,
    this._getWithdrawalsUseCase,
    this._requestWithdrawalUseCase,
    this._getShamCashAccountUseCase,
    this._setShamCashAccountUseCase,
    this._notificationHandler,
  ) : super(const WalletState()) {
    // Refresh wallet whenever financial notifications arrive
    _notificationSubscription =
        _notificationHandler.onNotificationReceived.listen((payload) {
      if (payload.type?.category == NotificationCategory.financial) {
        add(const WalletEvent.refresh());
      }
    });

    on<WalletEvent>((event, emit) async {
      await event.map(
        init: (e) async => _onInit(emit),
        refresh: (e) async => _onRefresh(emit),
        requestWithdrawal: (e) async => _onRequestWithdrawal(e.amount, emit),
        setShamCashAccount: (e) async => _onSetShamCashAccount(e.name, e.number, emit),
        selectWithdrawal: (e) async => _onSelectWithdrawal(e.id, emit),
      );
    });
  }

  Future<void> _onInit(Emitter<WalletState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final walletResult = await _getWalletUseCase(NoParams());
    final shamResult = await _getShamCashAccountUseCase(NoParams());
    final withdrawalsResult = await _getWithdrawalsUseCase(NoParams());

    walletResult.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (wallet) {
        final shamAccount = shamResult.getOrElse((_) => null);
        final withdrawalsList = withdrawalsResult.getOrElse((_) => []);

        emit(state.copyWith(
          isLoading: false,
          wallet: wallet,
          shamCashAccount: shamAccount,
          withdrawals: withdrawalsList,
        ));
      },
    );
  }

  Future<void> _onRefresh(Emitter<WalletState> emit) async {
    final walletResult = await _getWalletUseCase(NoParams());
    final shamResult = await _getShamCashAccountUseCase(NoParams());
    final withdrawalsResult = await _getWithdrawalsUseCase(NoParams());

    walletResult.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (wallet) {
        final shamAccount = shamResult.getOrElse((_) => state.shamCashAccount);
        final withdrawalsList = withdrawalsResult.getOrElse((_) => state.withdrawals);

        emit(state.copyWith(
          wallet: wallet,
          shamCashAccount: shamAccount,
          withdrawals: withdrawalsList,
        ));
      },
    );
  }

  Future<void> _onRequestWithdrawal(String amount, Emitter<WalletState> emit) async {
    // Pre-check 1: Sham Cash account must be linked
    if (state.shamCashAccount == null) {
      emit(state.copyWith(
        errorMessage: 'يرجى ربط حساب شام كاش أولاً لتتمكن من طلب السحب ⚠️',
      ));
      return;
    }

    // Pre-check 2: Amount validation
    final numAmount = double.tryParse(amount);
    if (numAmount == null || numAmount < 100.0) {
      emit(state.copyWith(
        errorMessage: 'الحد الأدنى لطلب السحب هو 100.00 ل.س',
      ));
      return;
    }

    final available = double.tryParse(state.wallet?.availableBalance ?? '0') ?? 0;
    if (numAmount > available) {
      emit(state.copyWith(
        errorMessage: 'الرصيد المتاح غير كافٍ لإتمام عملية السحب',
      ));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null, successMessage: null));

    final result = await _requestWithdrawalUseCase(amount);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        ));
      },
      (newWithdrawal) {
        final updatedList = [newWithdrawal, ...state.withdrawals];
        emit(state.copyWith(
          isSubmitting: false,
          withdrawals: updatedList,
          successMessage: 'تم إنشاء طلب السحب بنجاح وهو قيد المعالجة الآن ⏳',
        ));
        add(const WalletEvent.refresh());
      },
    );
  }

  Future<void> _onSetShamCashAccount(
    String name,
    String number,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null, successMessage: null));

    final result = await _setShamCashAccountUseCase(
      SetShamCashParams(name: name, number: number),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        final newAccount = ShamCashAccount(name: name, number: number);
        emit(state.copyWith(
          isSubmitting: false,
          shamCashAccount: newAccount,
          successMessage: 'تم حفظ وربط حساب شام كاش بنجاح ✅',
        ));
      },
    );
  }

  void _onSelectWithdrawal(int id, Emitter<WalletState> emit) {
    final item = state.withdrawals.cast<WithdrawalItem?>().firstWhere(
          (w) => w?.id == id,
          orElse: () => null,
        );
    emit(state.copyWith(selectedWithdrawal: item));
  }

  @override
  Future<void> close() {
    _notificationSubscription?.cancel();
    return super.close();
  }
}
