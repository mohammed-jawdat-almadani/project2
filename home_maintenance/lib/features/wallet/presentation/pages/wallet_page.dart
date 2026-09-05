import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/wallet_bloc.dart';
import '../bloc/wallet_event.dart';
import '../bloc/wallet_state.dart';
import '../widgets/link_sham_cash_dialog.dart';
import '../widgets/request_withdrawal_sheet.dart';
import '../widgets/sham_cash_card.dart';
import '../widgets/wallet_balance_card.dart';
import '../widgets/withdrawal_item_tile.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletBloc>()..add(const WalletEvent.init()),
      child: const _WalletView(),
    );
  }
}

class _WalletView extends StatelessWidget {
  const _WalletView();

  void _openLinkShamCash(BuildContext context, WalletState state) {
    showDialog(
      context: context,
      builder: (ctx) => BlocProvider.value(
        value: context.read<WalletBloc>(),
        child: LinkShamCashDialog(initialAccount: state.shamCashAccount),
      ),
    );
  }

  void _openRequestWithdrawal(BuildContext context, WalletState state) {
    if (state.shamCashAccount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.isArabic
                ? 'يرجى ربط حساب شام كاش أولاً لتتمكن من إنشاء طلب السحب ⚠️'
                : 'Please link your Sham Cash account first to request withdrawal ⚠️',
          ),
          backgroundColor: const Color(0xFFD97706),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          action: SnackBarAction(
            label: context.tr('link_account'),
            textColor: Colors.white,
            onPressed: () => _openLinkShamCash(context, state),
          ),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => BlocProvider.value(
        value: context.read<WalletBloc>(),
        child: RequestWithdrawalSheet(
          wallet: state.wallet!,
          shamCashAccount: state.shamCashAccount!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        backgroundColor: AppColors.surface(context),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            context.tr('tab_wallet'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary(context),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded, color: AppColors.primary(context)),
            onPressed: () {
              context.read<WalletBloc>().add(const WalletEvent.refresh());
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            );
          } else if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: const Color(0xFF16A34A),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.wallet == null) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primary(context)),
            );
          }

          final wallet = state.wallet;
          final isDark = AppColors.isDark(context);

          return RefreshIndicator(
            color: const Color(0xFF003882),
            onRefresh: () async {
              context.read<WalletBloc>().add(const WalletEvent.refresh());
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // 1. Wallet Balance Card
                  if (wallet != null)
                    WalletBalanceCard(
                      wallet: wallet,
                      onRequestWithdrawal: () => _openRequestWithdrawal(context, state),
                    ),

                  const SizedBox(height: 8),

                  // 2. Sham Cash Account Card (Link / Edit)
                  ShamCashCard(
                    account: state.shamCashAccount,
                    onLinkOrEdit: () => _openLinkShamCash(context, state),
                  ),

                  const SizedBox(height: 16),

                  // 3. Withdrawals History Section Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.tr('withdrawal_history'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary(context),
                          ),
                        ),
                        if (state.withdrawals.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${state.withdrawals.length} ${context.isArabic ? "عملية" : "items"}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary(context),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 4. Withdrawals List or Empty State
                  if (state.withdrawals.isEmpty)
                    _buildEmptyWithdrawals(context)
                  else
                    ...state.withdrawals.map((w) => WithdrawalItemTile(item: w)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyWithdrawals(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.border(context)),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.inputFill(context),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.history_rounded,
                size: 32,
                color: AppColors.textMuted(context),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              context.isArabic ? 'لا توجد طلبات سحب سابقة' : 'No previous withdrawals',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary(context),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              context.isArabic
                  ? 'عند إنشاء طلبات سحب جديدة ستظهر تفاصيلها وحالاتها هنا'
                  : 'New withdrawal requests and status updates will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textMuted(context)),
            ),
          ],
        ),
      ),
    );
  }
}
