import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
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
          content: const Text('يرجى ربط حساب شام كاش أولاً لتتمكن من إنشاء طلب السحب ⚠️'),
          backgroundColor: const Color(0xFFD97706),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          action: SnackBarAction(
            label: 'ربط الآن',
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
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            'المحفظة',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Color(0xFF003882)),
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
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF003882)),
            );
          }

          final wallet = state.wallet;

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
                        const Text(
                          'سجل طلبات السحب',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        if (state.withdrawals.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${state.withdrawals.length} عملية',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF003882),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 4. Withdrawals List or Empty State
                  if (state.withdrawals.isEmpty)
                    _buildEmptyWithdrawals()
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

  Widget _buildEmptyWithdrawals() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.history_rounded,
                size: 32,
                color: Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'لا توجد طلبات سحب سابقة',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF475569),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'عند إنشاء طلبات سحب جديدة ستظهر تفاصيلها وحالاتها هنا',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
      ),
    );
  }
}
