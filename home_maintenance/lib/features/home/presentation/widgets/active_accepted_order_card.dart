import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../orders/domain/entities/quote_part.dart';
import '../../../orders/presentation/widgets/closure_request_sheet.dart';
import '../../../orders/presentation/widgets/closure_verification_dialog.dart';
import '../../../orders/presentation/widgets/dispute_reassurance_card.dart';
import '../../../orders/presentation/widgets/send_quote_sheet.dart';
import '../../../orders/presentation/widgets/waiting_for_parts_dialog.dart';
import '../../domain/entities/dispatch_offer.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class ActiveAcceptedOrderCard extends StatelessWidget {
  final DispatchOffer order;
  final VoidCallback? onLocateClient;

  const ActiveAcceptedOrderCard({
    super.key,
    required this.order,
    this.onLocateClient,
  });

  void _showWithdrawConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.surface(context),
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Color(0xFFDC2626), size: 28),
            const SizedBox(width: 8),
            Text(
              context.tr('withdraw_confirm_title'),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(context),
              ),
            ),
          ],
        ),
        content: Text(
          context.tr('withdraw_confirm_desc'),
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context), height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(context.tr('cancel'), style: TextStyle(color: AppColors.textSecondary(context))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<HomeBloc>().add(HomeEvent.withdrawOrder(order.orderId));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(context.tr('confirm')),
          ),
        ],
      ),
    );
  }

  void _showClientNoShowConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.surface(context),
        title: Row(
          children: [
            const Icon(Icons.person_off_rounded, color: Color(0xFFDC2626), size: 28),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                context.tr('client_no_show_confirm_title'),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
            ),
          ],
        ),
        content: Text(
          context.tr('client_no_show_confirm_desc'),
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context), height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(context.tr('cancel'), style: TextStyle(color: AppColors.textSecondary(context))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<HomeBloc>().add(HomeEvent.reportClientNoShow(order.orderId));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(context.tr('confirm')),
          ),
        ],
      ),
    );
  }

  void _openSendQuoteSheet(BuildContext context, {bool isAddon = false}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SendQuoteSheet(
        orderId: order.orderId,
        isAddon: isAddon,
        onSendQuote: ({
          required int orderId,
          required String laborCost,
          required int warrantyDays,
          required List<QuotePart> parts,
        }) {
          context.read<HomeBloc>().add(
                HomeEvent.sendQuote(
                  orderId: orderId,
                  laborCost: laborCost,
                  warrantyDays: warrantyDays,
                  parts: parts,
                ),
              );
        },
        onSendAddonQuote: ({
          required int orderId,
          required String laborCost,
          required List<QuotePart> parts,
        }) {
          context.read<HomeBloc>().add(
                HomeEvent.sendAddonQuote(
                  orderId: orderId,
                  laborCost: laborCost,
                  parts: parts,
                ),
              );
        },
      ),
    );
  }

  void _openWaitingForPartsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => WaitingForPartsDialog(
        orderId: order.orderId,
        onConfirm: (orderId, note) {
          context.read<HomeBloc>().add(
                HomeEvent.requestWaitingForParts(
                  orderId: orderId,
                  note: note,
                ),
              );
        },
      ),
    );
  }

  void _openClosureRequestSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => ClosureRequestSheet(
        orderId: order.orderId,
        onSubmitPhotos: (orderId, photos) {
          context.read<HomeBloc>().add(
                HomeEvent.requestClosure(
                  orderId: orderId,
                  photos: photos,
                ),
              );
        },
      ),
    );
  }

  void _openClosureVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => ClosureVerificationDialog(
        orderId: order.orderId,
        onVerify: (orderId, code) {
          context.read<HomeBloc>().add(
                HomeEvent.verifyClosure(
                  orderId: orderId,
                  code: code,
                ),
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rawStatus = order.status?.toLowerCase() ?? 'accepted';
    final isActuallyArrived = rawStatus == 'arrived' || order.arrivedAt != null;
    final status = (isActuallyArrived && (rawStatus == 'accepted' || rawStatus == 'offered'))
        ? 'arrived'
        : rawStatus;
    final isArrived = status == 'arrived';
    final isQuotePending = status == 'quote_pending';
    final isQuoteRejected = status == 'quote_rejected' || status == 'rejected';
    final isInProgress = status == 'in_progress' || status == 'repairing';
    final isPartsWaiting = status == 'parts_waiting';
    final isClosurePending = status == 'closure_pending';
    final isDisputed = status == 'disputed';
    final isBeforeArrival = !isActuallyArrived && (status == 'accepted' || status == 'offered');
    final isDark = AppColors.isDark(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: isDisputed
              ? const Color(0xFFFECACA)
              : (isQuoteRejected
                  ? const Color(0xFFFDE68A)
                  : (isArrived || isInProgress || isClosurePending
                      ? const Color(0xFF86EFAC)
                      : (isDark ? const Color(0xFF1E40AF) : const Color(0xFF93C5FD)))),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.14),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row with Dynamic Status Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusHeader(context, status),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${context.tr('order_no')}${order.orderId}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary(context),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Service & Client Info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.inputFill(context),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.handyman_rounded,
                      size: 22,
                      color: AppColors.primary(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary(context),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${context.tr('client')}: ${order.clientName}',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (order.clientAddress.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 14, color: AppColors.textMuted(context)),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  order.clientAddress,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary(context),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),

              // Dispute Reassurance Message if Disputed
              if (isDisputed) ...[
                const SizedBox(height: 10),
                const DisputeReassuranceCard(),
              ],

              const SizedBox(height: 14),
              Divider(height: 1, color: AppColors.border(context)),
              const SizedBox(height: 12),

              // Dynamic Action Controls based on State
              if (isBeforeArrival)
                _buildBeforeArrivalActions(context)
              else if (isArrived)
                _buildArrivedActions(context)
              else if (isQuotePending)
                _buildQuotePendingActions(context)
              else if (isQuoteRejected)
                _buildQuoteRejectedActions(context)
              else if (isInProgress)
                _buildInProgressActions(context)
              else if (isPartsWaiting)
                _buildPartsWaitingActions(context)
              else if (isClosurePending)
                _buildClosurePendingActions(context)
              else if (isDisputed)
                _buildDisputedActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusHeader(BuildContext context, String status) {
    final isDark = AppColors.isDark(context);
    String label = context.tr('order_accepted_header');
    Color iconColor = isDark ? const Color(0xFF38BDF8) : const Color(0xFF003882);
    Color bgColor = isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF);
    IconData icon = Icons.directions_car_rounded;

    if (status == 'arrived') {
      label = context.tr('arrived_header');
      iconColor = const Color(0xFF16A34A);
      bgColor = isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7);
      icon = Icons.location_on_rounded;
    } else if (status == 'quote_pending') {
      label = context.tr('quote_pending_header');
      iconColor = const Color(0xFFD97706);
      bgColor = isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7);
      icon = Icons.hourglass_empty_rounded;
    } else if (status == 'quote_rejected' || status == 'rejected') {
      label = context.tr('quote_rejected_header');
      iconColor = const Color(0xFFD97706);
      bgColor = isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7);
      icon = Icons.cancel_outlined;
    } else if (status == 'in_progress' || status == 'repairing') {
      label = context.tr('in_progress_header');
      iconColor = isDark ? const Color(0xFF38BDF8) : const Color(0xFF003882);
      bgColor = isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF);
      icon = Icons.build_circle_rounded;
    } else if (status == 'parts_waiting') {
      label = context.tr('parts_waiting_header');
      iconColor = const Color(0xFFD97706);
      bgColor = isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7);
      icon = Icons.hourglass_top_rounded;
    } else if (status == 'closure_pending') {
      label = context.tr('closure_pending_header');
      iconColor = const Color(0xFF16A34A);
      bgColor = isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7);
      icon = Icons.lock_open_rounded;
    } else if (status == 'disputed') {
      label = context.tr('dispute_header');
      iconColor = const Color(0xFFDC2626);
      bgColor = isDark ? const Color(0xFF7F1D1D).withValues(alpha: 0.3) : const Color(0xFFFEE2E2);
      icon = Icons.shield_outlined;
    }

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Icon(icon, size: 16, color: iconColor),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: iconColor,
          ),
        ),
      ],
    );
  }

  // 1. Before Arrival Actions: Arrive, Chat, Withdraw
  Widget _buildBeforeArrivalActions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<HomeBloc>().add(HomeEvent.arriveOrder(order.orderId));
            },
            icon: const Icon(Icons.location_on_rounded, size: 18),
            label: Text(context.tr('arrive_at_location'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF16A34A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildChatButton(context)),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _showWithdrawConfirmation(context),
                icon: const Icon(Icons.logout_rounded, size: 16, color: Color(0xFFDC2626)),
                label: Text(context.tr('withdraw_order'), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFDC2626))),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  side: const BorderSide(color: Color(0xFFFCA5A5)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
            if (onLocateClient != null) ...[
              const SizedBox(width: 8),
              _buildMapButton(context),
            ],
          ],
        ),
      ],
    );
  }

  // 2. Arrived Actions: Send Quote (Primary), Chat, Client No-Show
  Widget _buildArrivedActions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _openSendQuoteSheet(context, isAddon: false),
            icon: const Icon(Icons.request_quote_rounded, size: 18),
            label: Text(context.tr('send_quote_btn'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003882),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildChatButton(context)),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _showClientNoShowConfirmation(context),
                icon: const Icon(Icons.person_off_rounded, size: 16, color: Color(0xFFDC2626)),
                label: Text(
                  context.tr('client_no_show_btn'),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFDC2626)),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  side: const BorderSide(color: Color(0xFFFCA5A5)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 3. Quote Pending Actions: Chat with customer while waiting
  Widget _buildQuotePendingActions(BuildContext context) {
    final isDark = AppColors.isDark(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.access_time_filled_rounded, color: Color(0xFFD97706), size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.tr('quote_pending_desc'),
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? const Color(0xFFFDE68A) : const Color(0xFF92400E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildChatButton(context),
      ],
    );
  }

  // 3b. Quote Rejected Actions: Show rejection card & inspection fee credited notification
  Widget _buildQuoteRejectedActions(BuildContext context) {
    final fee = order.inspectionFee ?? '50.00';
    final isDark = AppColors.isDark(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isDark ? const Color(0xFF059669) : const Color(0xFF86EFAC)),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${context.tr('quote_rejected_desc')}\n(${context.tr('inspection_fee')}: $fee ${context.tr('currency')})',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF15803D),
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<HomeBloc>().add(const HomeEvent.changeTab(2));
                },
                icon: const Icon(Icons.account_balance_wallet_rounded, size: 16),
                label: Text(context.tr('tab_wallet'), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003882),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 4. In Progress Actions: Request Closure (Green), Add-on Quote, Waiting for parts, Chat
  Widget _buildInProgressActions(BuildContext context) {
    return Column(
      children: [
        // Primary: Finish & Request Closure
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _openClosureRequestSheet(context),
            icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
            label: Text(context.tr('finish_and_closure'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF16A34A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Add-on Quote Button
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _openSendQuoteSheet(context, isAddon: true),
                icon: Icon(Icons.add_circle_outline_rounded, size: 15, color: AppColors.primary(context)),
                label: Text(context.tr('send_addon_quote'), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary(context))),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  side: BorderSide(color: AppColors.border(context)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Waiting for parts Button
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _openWaitingForPartsDialog(context),
                icon: const Icon(Icons.hourglass_top_rounded, size: 15, color: Color(0xFFD97706)),
                label: Text(context.tr('waiting_for_parts_btn'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFD97706))),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  side: const BorderSide(color: Color(0xFFFDE68A)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildChatButton(context),
      ],
    );
  }

  // 5. Parts Waiting Actions: Resume Order, Chat
  Widget _buildPartsWaitingActions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<HomeBloc>().add(HomeEvent.resumeOrder(order.orderId));
            },
            icon: const Icon(Icons.play_arrow_rounded, size: 20),
            label: Text(context.tr('resume_order_btn'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003882),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildChatButton(context),
      ],
    );
  }

  // 6. Closure Pending Actions: Enter Closure Code, Chat
  Widget _buildClosurePendingActions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _openClosureVerificationDialog(context),
            icon: const Icon(Icons.pin_rounded, size: 18),
            label: Text(context.tr('enter_closure_code_btn'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF16A34A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildChatButton(context),
      ],
    );
  }

  // 7. Disputed Actions: Chat
  Widget _buildDisputedActions(BuildContext context) {
    return _buildChatButton(context);
  }

  Widget _buildChatButton(BuildContext context) {
    final clientTitle = (order.clientName.isNotEmpty && order.clientName != 'العميل')
        ? order.clientName
        : context.tr('client');
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          context.push(
            '/chat/${order.orderId}?clientName=${Uri.encodeComponent(clientTitle)}',
          );
        },
        icon: const Icon(Icons.chat_bubble_rounded, size: 16),
        label: Text(context.tr('chat_with_client'), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF003882),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildMapButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputFill(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(Icons.my_location_rounded, color: AppColors.primary(context), size: 20),
        onPressed: onLocateClient,
        tooltip: context.tr('address'),
      ),
    );
  }
}
