import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/authenticated_image.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/bloc/home_event.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/quote_part.dart';
import 'closure_request_sheet.dart';
import 'closure_verification_dialog.dart';
import 'dispute_reassurance_card.dart';
import 'send_quote_sheet.dart';
import 'waiting_for_parts_dialog.dart';

class OrderDetailsSheet extends StatelessWidget {
  final OrderItem order;

  const OrderDetailsSheet({
    super.key,
    required this.order,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final local = date.toLocal();
    return '${local.year}/${local.month.toString().padLeft(2, '0')}/${local.day.toString().padLeft(2, '0')} - ${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }

  void _showWithdrawConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(HomeEvent.withdrawOrder(order.id));
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
        backgroundColor: AppColors.surface(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(HomeEvent.reportClientNoShow(order.id));
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
        orderId: order.id,
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
        orderId: order.id,
        onConfirm: (orderId, note) {
          context.read<HomeBloc>().add(
                HomeEvent.requestWaitingForParts(orderId: orderId, note: note),
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
        orderId: order.id,
        onSubmitPhotos: (orderId, photos) {
          context.read<HomeBloc>().add(
                HomeEvent.requestClosure(orderId: orderId, photos: photos),
              );
        },
      ),
    );
  }

  void _openClosureVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => ClosureVerificationDialog(
        orderId: order.id,
        onVerify: (orderId, code) {
          context.read<HomeBloc>().add(
                HomeEvent.verifyClosure(orderId: orderId, code: code),
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rawStatus = order.status.toLowerCase();
    final isActuallyArrived = rawStatus == 'arrived' || order.arrivedAt != null;
    final status = (isActuallyArrived && (rawStatus == 'accepted' || rawStatus == 'assigned'))
        ? 'arrived'
        : rawStatus;
    final isArrived = status == 'arrived';
    final isQuotePending = status == 'quote_pending';
    final isQuoteRejected = status == 'quote_rejected' || status == 'rejected';
    final isInProgress = status == 'in_progress' || status == 'repairing';
    final isPartsWaiting = status == 'parts_waiting';
    final isClosurePending = status == 'closure_pending';
    final isDisputed = status == 'disputed';
    final isAccepted = !isActuallyArrived && (status == 'accepted' || status == 'assigned');
    final isCompleted = status == 'completed';
    final maxHeight = MediaQuery.sizeOf(context).height * 0.88;
    final isDark = AppColors.isDark(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.border(context),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.handyman_rounded, color: AppColors.primary(context), size: 24),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.serviceCategoryName,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary(context),
                            ),
                          ),
                          Text(
                            '${context.tr('order_no')}${order.id}',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isArrived || isInProgress || isCompleted
                          ? (isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFDCFCE7))
                          : (isDisputed
                              ? (isDark ? const Color(0xFF7F1D1D).withValues(alpha: 0.3) : const Color(0xFFFEE2E2))
                              : (isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF))),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _getStatusLabel(context, status),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isArrived || isInProgress || isCompleted
                            ? const Color(0xFF16A34A)
                            : (isDisputed ? const Color(0xFFDC2626) : AppColors.primary(context)),
                      ),
                    ),
                  ),
                ],
              ),

              if (isDisputed) ...[
                const SizedBox(height: 12),
                const DisputeReassuranceCard(),
              ],

              const SizedBox(height: 16),
              Divider(color: AppColors.border(context)),
              const SizedBox(height: 12),

              // Problem Description
              if (order.description != null && order.description!.isNotEmpty) ...[
                Text(
                  context.tr('problem_desc'),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary(context),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.inputFill(context),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.border(context)),
                  ),
                  child: Text(
                    order.description!,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary(context),
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
              ],

              // Photos Gallery
              if (order.photos.isNotEmpty) ...[
                Text(
                  '${context.tr('details')} (${order.photos.length}):',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary(context),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 75,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: order.photos.length,
                    separatorBuilder: (ctx, i) => const SizedBox(width: 10),
                    itemBuilder: (ctx, i) {
                      return AuthenticatedImage(
                        imageUrl: order.photos[i].url,
                        width: 75,
                        height: 75,
                        borderRadius: BorderRadius.circular(12),
                        enableZoomOnTap: true,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Structured Location & Pricing Card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.inputFill(context),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border(context)),
                ),
                child: Column(
                  children: [
                    if (order.address != null) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on_rounded, size: 18, color: Color(0xFFEF4444)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.address!.label ?? context.tr('address'),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary(context),
                                  ),
                                ),
                                if (order.address!.buildingNo != null || order.address!.floor != null) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    '${order.address!.buildingNo != null ? "بناء ${order.address!.buildingNo}، " : ""}${order.address!.floor != null ? "طابق ${order.address!.floor}" : ""}',
                                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
                                  ),
                                ],
                                if (order.address!.notes != null && order.address!.notes!.isNotEmpty) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    '${context.tr('notes')}: ${order.address!.notes}',
                                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(color: AppColors.border(context)),
                      const SizedBox(height: 8),
                    ],

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.tr('inspection_fee')}:',
                          style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context)),
                        ),
                        Text(
                          '${order.inspectionFee ?? "50.00"} ${context.tr('currency')}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF16A34A),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.tr('date')}:',
                          style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context)),
                        ),
                        Text(
                          _formatDate(order.createdAt),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= Dynamic Action Buttons =================
              if (isAccepted) ...[
                // 1. Arrive Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<HomeBloc>().add(HomeEvent.arriveOrder(order.id));
                    },
                    icon: const Icon(Icons.location_on_rounded, size: 18),
                    label: Text(context.tr('arrive_at_location'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Withdraw Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showWithdrawConfirmation(context),
                    icon: const Icon(Icons.logout_rounded, size: 18, color: Color(0xFFDC2626)),
                    label: Text(context.tr('withdraw_order'), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFDC2626))),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFCA5A5)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ] else if (isArrived) ...[
                // 2. Send Quote
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _openSendQuoteSheet(context, isAddon: false);
                    },
                    icon: const Icon(Icons.request_quote_rounded, size: 18),
                    label: Text(context.tr('send_quote_btn'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003882),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Client No-Show Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showClientNoShowConfirmation(context),
                    icon: const Icon(Icons.person_off_rounded, size: 18, color: Color(0xFFDC2626)),
                    label: Text(
                      context.tr('client_no_show_btn'),
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFDC2626)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFCA5A5)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ] else if (isQuotePending) ...[
                // 3. Quote Pending Info
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
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
                const SizedBox(height: 10),
              ] else if (isQuoteRejected) ...[
                // 3b. Quote Rejected Info
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
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
                          '${context.tr('quote_rejected_desc')}\n(${context.tr('inspection_fee')}: ${order.inspectionFee ?? "50.00"} ${context.tr('currency')})',
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<HomeBloc>().add(const HomeEvent.changeTab(2));
                    },
                    icon: const Icon(Icons.account_balance_wallet_rounded, size: 16),
                    label: Text(context.tr('tab_wallet'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003882),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ] else if (isInProgress) ...[
                // 3. In Progress Actions
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _openClosureRequestSheet(context);
                    },
                    icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
                    label: Text(context.tr('finish_and_closure'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _openSendQuoteSheet(context, isAddon: true);
                        },
                        icon: Icon(Icons.add_circle_outline_rounded, size: 16, color: AppColors.primary(context)),
                        label: Text(context.tr('send_addon_quote'), style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary(context))),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: BorderSide(color: AppColors.border(context)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _openWaitingForPartsDialog(context);
                        },
                        icon: const Icon(Icons.hourglass_top_rounded, size: 16, color: Color(0xFFD97706)),
                        label: Text(context.tr('waiting_for_parts_btn'), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD97706))),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Color(0xFFFDE68A)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ] else if (isPartsWaiting) ...[
                // 4. Resume Order
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<HomeBloc>().add(HomeEvent.resumeOrder(order.id));
                    },
                    icon: const Icon(Icons.play_arrow_rounded, size: 20),
                    label: Text(context.tr('resume_order_btn'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003882),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ] else if (isClosurePending) ...[
                // 5. Enter Closure Code
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _openClosureVerificationDialog(context);
                    },
                    icon: const Icon(Icons.pin_rounded, size: 18),
                    label: Text(context.tr('enter_closure_code_btn'), style: const TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],

              // Chat Button (Active on all non-completed orders)
              if (!isCompleted) ...[
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      final clientTitle = (order.clientName != null && order.clientName!.isNotEmpty)
                          ? order.clientName!
                          : context.tr('client');
                      context.push(
                        '/chat/${order.id}?clientName=${Uri.encodeComponent(clientTitle)}',
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_rounded, size: 18),
                    label: Text(
                      context.tr('chat_with_client'),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003882),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary(context),
                    side: BorderSide(color: AppColors.border(context)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(context.tr('close')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getStatusLabel(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'arrived':
        return context.tr('arrived_header');
      case 'quote_pending':
        return context.tr('quote_pending_header');
      case 'in_progress':
      case 'repairing':
        return context.tr('in_progress_header');
      case 'parts_waiting':
        return context.tr('parts_waiting_header');
      case 'closure_pending':
        return context.tr('closure_pending_header');
      case 'disputed':
        return context.tr('dispute_header');
      case 'completed':
        return context.tr('completed_header');
      default:
        return status;
    }
  }
}
