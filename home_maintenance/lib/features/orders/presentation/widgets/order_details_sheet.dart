import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
    if (date == null) return 'غير محدد';
    final local = date.toLocal();
    return '${local.year}/${local.month.toString().padLeft(2, '0')}/${local.day.toString().padLeft(2, '0')} - ${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }

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
              Navigator.of(context).pop();
              context.read<HomeBloc>().add(HomeEvent.withdrawOrder(order.id));
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
        orderId: order.id,
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

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
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
                    color: const Color(0xFFE2E8F0),
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
                        decoration: const BoxDecoration(
                          color: Color(0xFFEEF2FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.handyman_rounded, color: Color(0xFF003882), size: 24),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.serviceCategoryName,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          Text(
                            'طلب #${order.id}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
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
                          ? const Color(0xFFDCFCE7)
                          : (isDisputed ? const Color(0xFFFEE2E2) : const Color(0xFFEEF2FF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _getStatusLabel(status),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isArrived || isInProgress || isCompleted
                            ? const Color(0xFF16A34A)
                            : (isDisputed ? const Color(0xFFDC2626) : const Color(0xFF003882)),
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
              const Divider(color: Color(0xFFF1F5F9)),
              const SizedBox(height: 12),

              // Problem Description
              if (order.description != null && order.description!.isNotEmpty) ...[
                const Text(
                  'تفاصيل المشكلة:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    order.description!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1E293B),
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
              ],

              // Photos Gallery
              if (order.photos.isNotEmpty) ...[
                const Text(
                  'صور العطل المرفقة (اضغط للتكبير):',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64748B),
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
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
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
                                  order.address!.label ?? 'موقع العميل',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                                if (order.address!.buildingNo != null || order.address!.floor != null) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    '${order.address!.buildingNo != null ? "بناء ${order.address!.buildingNo}، " : ""}${order.address!.floor != null ? "طابق ${order.address!.floor}" : ""}',
                                    style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                  ),
                                ],
                                if (order.address!.notes != null && order.address!.notes!.isNotEmpty) ...[
                                  const SizedBox(height: 2),
                                  Text(
                                    'ملاحظات: ${order.address!.notes}',
                                    style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Color(0xFFE2E8F0)),
                      const SizedBox(height: 8),
                    ],

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'أجور الكشف:',
                          style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                        ),
                        Text(
                          '${order.inspectionFee ?? "50.00"} ل.س',
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
                        const Text(
                          'تاريخ الإنشاء:',
                          style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                        ),
                        Text(
                          _formatDate(order.createdAt),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E293B),
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
                    label: const Text('تم الوصول إلى الموقع 📍', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    label: const Text('الانسحاب من الطلب ⚠️', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFDC2626))),
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
                    label: const Text('إرسال عرض السعر للعميل 📋', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003882),
                      foregroundColor: Colors.white,
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
                    color: const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.access_time_filled_rounded, color: Color(0xFFD97706), size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'تم إرسال عرض السعر وبانتظار موافقة العميل للبدء بالصيانة ⏳',
                          style: TextStyle(fontSize: 12, color: Color(0xFF92400E), fontWeight: FontWeight.w600),
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
                          'قام العميل برفض عرض السعر.\nتم احتساب وإضافة أجور الكشفية (${order.inspectionFee ?? "50.00"} ل.س) مباشرة إلى محفظتك 💼✅',
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<HomeBloc>().add(const HomeEvent.changeTab(2));
                    },
                    icon: const Icon(Icons.account_balance_wallet_rounded, size: 16),
                    label: const Text('الانتقال إلى المحفظة 💳', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    label: const Text('إنهاء العمل وطلب كود الإغلاق 🏁', style: TextStyle(fontWeight: FontWeight.bold)),
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
                        icon: const Icon(Icons.add_circle_outline_rounded, size: 16, color: Color(0xFF003882)),
                        label: const Text('عرض إضافي ➕', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF003882))),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Color(0xFFCBD5E1)),
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
                        label: const Text('انتظار قطعة ⏳', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD97706))),
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
                    label: const Text('استئناف العمل على الطلب الآن ▶️', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    label: const Text('إدخال كود الإغلاق من العميل 🔐', style: TextStyle(fontWeight: FontWeight.bold)),
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
                      context.push(
                        '/chat/${order.id}?clientName=${Uri.encodeComponent(order.clientName ?? "العميل")}',
                      );
                    },
                    icon: const Icon(Icons.chat_bubble_rounded, size: 18),
                    label: const Text(
                      'محادثة العميل 💬',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                    foregroundColor: const Color(0xFF64748B),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('إغلاق النافذة'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'arrived':
        return 'تم الوصول 📍';
      case 'quote_pending':
        return 'بانتظار العرض ⏳';
      case 'in_progress':
      case 'repairing':
        return 'قيد التنفيذ 🛠️';
      case 'parts_waiting':
        return 'انتظار قطعة ⏳';
      case 'closure_pending':
        return 'بانتظار الكود 🔐';
      case 'disputed':
        return 'اعتراض 🛡️';
      case 'completed':
        return 'مكتمل ✅';
      default:
        return status;
    }
  }
}
