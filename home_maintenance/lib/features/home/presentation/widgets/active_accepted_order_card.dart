import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Color(0xFFDC2626), size: 28),
            SizedBox(width: 8),
            Text(
              'الانسحاب من الطلب',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
        content: const Text(
          'هل أنت متأكد من رغبتك في الانسحاب من هذا الطلب؟ سيتم إلغاء تعيينك وإعادة إتاحة الطلب لفنيين آخرين.',
          style: TextStyle(fontSize: 13, color: Color(0xFF475569), height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('إلغاء', style: TextStyle(color: Color(0xFF64748B))),
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
            child: const Text('تأكيد الانسحاب'),
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
          if (isAddon) {
            context.read<HomeBloc>().add(
                  HomeEvent.sendAddonQuote(
                    orderId: orderId,
                    laborCost: laborCost,
                    parts: parts,
                  ),
                );
          } else {
            context.read<HomeBloc>().add(
                  HomeEvent.sendQuote(
                    orderId: orderId,
                    laborCost: laborCost,
                    warrantyDays: warrantyDays,
                    parts: parts,
                  ),
                );
          }
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
        orderId: order.orderId,
        onSubmit: (orderId, photos) {
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
        orderId: order.orderId,
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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: isDisputed
              ? const Color(0xFFFECACA)
              : (isQuoteRejected
                  ? const Color(0xFFFDE68A)
                  : (isArrived || isInProgress || isClosurePending
                      ? const Color(0xFF86EFAC)
                      : const Color(0xFF93C5FD))),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF003882).withValues(alpha: 0.14),
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
                  _buildStatusHeader(status),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'طلب #${order.orderId}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003882),
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
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.handyman_rounded,
                      size: 22,
                      color: Color(0xFF003882),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'العميل: ${order.clientName}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF475569),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (order.clientAddress.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF94A3B8)),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  order.clientAddress,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF64748B),
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
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
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

  Widget _buildStatusHeader(String status) {
    String label = 'طلب مقبول / قيد التوجه للعميل';
    Color iconColor = const Color(0xFF003882);
    Color bgColor = const Color(0xFFEEF2FF);
    IconData icon = Icons.directions_car_rounded;

    if (status == 'arrived') {
      label = 'تم الوصول إلى الموقع 📍';
      iconColor = const Color(0xFF16A34A);
      bgColor = const Color(0xFFDCFCE7);
      icon = Icons.location_on_rounded;
    } else if (status == 'quote_pending') {
      label = 'بانتظار موافقة العميل على العرض ⏳';
      iconColor = const Color(0xFFD97706);
      bgColor = const Color(0xFFFEF3C7);
      icon = Icons.hourglass_empty_rounded;
    } else if (status == 'quote_rejected' || status == 'rejected') {
      label = 'رفض العميل عرض السعر ⚠️';
      iconColor = const Color(0xFFD97706);
      bgColor = const Color(0xFFFEF3C7);
      icon = Icons.cancel_outlined;
    } else if (status == 'in_progress' || status == 'repairing') {
      label = 'قيد تنفيذ الصيانة 🛠️';
      iconColor = const Color(0xFF003882);
      bgColor = const Color(0xFFEEF2FF);
      icon = Icons.build_circle_rounded;
    } else if (status == 'parts_waiting') {
      label = 'بانتظار قطعة غيار (مهلة 72 ساعة) ⏳';
      iconColor = const Color(0xFFD97706);
      bgColor = const Color(0xFFFEF3C7);
      icon = Icons.hourglass_top_rounded;
    } else if (status == 'closure_pending') {
      label = 'بانتظار كود الإغلاق من العميل 🔐';
      iconColor = const Color(0xFF16A34A);
      bgColor = const Color(0xFFDCFCE7);
      icon = Icons.lock_open_rounded;
    } else if (status == 'disputed') {
      label = 'اعتراض قيد المراجعة 🛡️';
      iconColor = const Color(0xFFDC2626);
      bgColor = const Color(0xFFFEE2E2);
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
            label: const Text('تم الوصول إلى الموقع 📍', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                label: const Text('انسحاب', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFDC2626))),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  side: const BorderSide(color: Color(0xFFFCA5A5)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
            if (onLocateClient != null) ...[
              const SizedBox(width: 8),
              _buildMapButton(),
            ],
          ],
        ),
      ],
    );
  }

  // 2. Arrived Actions: Send Quote (Primary), Chat
  Widget _buildArrivedActions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _openSendQuoteSheet(context, isAddon: false),
            icon: const Icon(Icons.request_quote_rounded, size: 18),
            label: const Text('إرسال عرض السعر للعميل 📋', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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

  // 3. Quote Pending Actions: Chat with customer while waiting
  Widget _buildQuotePendingActions(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF3C7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(Icons.access_time_filled_rounded, color: Color(0xFFD97706), size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'تم إرسال العرض بنجاح وبانتظار موافقة العميل لبدء الصيانة ⏳',
                  style: TextStyle(fontSize: 12, color: Color(0xFF92400E), fontWeight: FontWeight.w600),
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
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFDCFCE7),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF86EFAC)),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'قام العميل برفض عرض السعر.\nتم احتساب وإضافة أجور الكشفية ($fee ل.س) مباشرة إلى محفظتك 💼✅',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF15803D),
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
                label: const Text('عرض المحفظة 💳', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
            label: const Text('إنهاء العمل وطلب كود الإغلاق 🏁', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                icon: const Icon(Icons.add_circle_outline_rounded, size: 15, color: Color(0xFF003882)),
                label: const Text('عرض إضافي ➕', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF003882))),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  side: const BorderSide(color: Color(0xFFCBD5E1)),
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
                label: const Text('انتظار قطعة ⏳', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFD97706))),
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
            label: const Text('استئناف العمل على الطلب الآن ▶️', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
            label: const Text('إدخال كود الإغلاق من العميل 🔐', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          context.push(
            '/chat/${order.orderId}?clientName=${Uri.encodeComponent(order.clientName)}',
          );
        },
        icon: const Icon(Icons.chat_bubble_rounded, size: 16),
        label: const Text('محادثة العميل 💬', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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

  Widget _buildMapButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(Icons.my_location_rounded, color: Color(0xFF003882), size: 20),
        onPressed: onLocateClient,
        tooltip: 'موقع العميل على الخريطة',
      ),
    );
  }
}
