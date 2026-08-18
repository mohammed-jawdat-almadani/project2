import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/authenticated_image.dart';
import '../../domain/entities/dispatch_offer.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class IncomingOrderSheet extends StatefulWidget {
  final DispatchOffer offer;

  const IncomingOrderSheet({
    super.key,
    required this.offer,
  });

  @override
  State<IncomingOrderSheet> createState() => _IncomingOrderSheetState();
}

class _IncomingOrderSheetState extends State<IncomingOrderSheet> {
  Timer? _countdownTimer;
  int _secondsRemaining = 90;
  int _totalSeconds = 90;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    if (widget.offer.expiresAt != null) {
      final now = DateTime.now();
      final diff = widget.offer.expiresAt!.difference(now).inSeconds;
      _secondsRemaining = diff > 0 ? diff : 0;
      if (widget.offer.offeredAt != null) {
        _totalSeconds = widget.offer.expiresAt!.difference(widget.offer.offeredAt!).inSeconds;
        if (_totalSeconds <= 0) _totalSeconds = 90;
      } else {
        _totalSeconds = _secondsRemaining > 0 ? _secondsRemaining : 90;
      }
    }

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        if (mounted) {
          setState(() {
            _secondsRemaining--;
          });
        }
      } else {
        timer.cancel();
        // Offer expired -> automatically dismiss sheet and refresh offers
        if (mounted) {
          context.read<HomeBloc>().add(const HomeEvent.dismissOffer());
          context.read<HomeBloc>().add(const HomeEvent.fetchOffers());
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant IncomingOrderSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.offer.id != widget.offer.id) {
      _countdownTimer?.cancel();
      _initTimer();
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  String _formatDuration(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;
    final isUrgent = offer.orderType == 'urgent';
    final isWarranty = offer.orderKind == 'warranty';
    final isScheduled = offer.orderType == 'scheduled' || offer.scheduledAt != null;
    final progress = _totalSeconds > 0 ? (_secondsRemaining / _totalSeconds).clamp(0.0, 1.0) : 0.0;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.80;
    final isDark = AppColors.isDark(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final isProcessing = state.isProcessingOffer;

        return Container(
          margin: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 12.0),
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: BorderRadius.circular(26.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.16),
                blurRadius: 24,
                offset: const Offset(0, -4),
              ),
            ],
            border: Border.all(
              color: AppColors.border(context),
              width: 1.0,
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag Handle Indicator
                  Center(
                    child: Container(
                      width: 44,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: AppColors.border(context),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // 1. Top Expiration Timer Bar & Order ID
                  if (offer.expiresAt != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              size: 18,
                              color: _secondsRemaining < 20 ? const Color(0xFFDC2626) : AppColors.primary(context),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${context.tr('time')}: ${_formatDuration(_secondsRemaining)}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: _secondsRemaining < 20 ? const Color(0xFFDC2626) : AppColors.primary(context),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.inputFill(context),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${context.tr('order_no')}${offer.orderId}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textSecondary(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: AppColors.inputFill(context),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _secondsRemaining < 20 ? const Color(0xFFDC2626) : AppColors.primary(context),
                        ),
                        minHeight: 5,
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],

                  // 2. Service Category & Status Badges
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isUrgent
                              ? (isDark ? const Color(0xFF7F1D1D) : const Color(0xFFFEF2F2))
                              : (isDark ? const Color(0xFF1E3A8A) : const Color(0xFFEEF2FF)),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Icon(
                          isUrgent ? Icons.bolt_rounded : Icons.build_circle_rounded,
                          color: isUrgent ? const Color(0xFFEF4444) : AppColors.primary(context),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.serviceName,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary(context),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                if (isUrgent)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: isDark ? const Color(0xFF991B1B).withValues(alpha: 0.3) : const Color(0xFFFEE2E2),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      context.tr('urgent'),
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFEF4444),
                                      ),
                                    ),
                                  ),
                                if (isScheduled)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: isDark ? const Color(0xFF0369A1).withValues(alpha: 0.3) : const Color(0xFFE0F2FE),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      context.tr('scheduled'),
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF38BDF8),
                                      ),
                                    ),
                                  ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: isWarranty
                                        ? (isDark ? const Color(0xFF581C87).withValues(alpha: 0.3) : const Color(0xFFF3E8FF))
                                        : AppColors.inputFill(context),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    isWarranty ? context.tr('warranty') : context.tr('normal'),
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: isWarranty ? const Color(0xFFC084FC) : AppColors.textSecondary(context),
                                    ),
                                  ),
                                ),
                                if (offer.distanceKm != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: AppColors.inputFill(context),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.near_me_rounded, size: 12, color: AppColors.textSecondary(context)),
                                        const SizedBox(width: 4),
                                        Text(
                                          offer.distanceKm!,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textSecondary(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // 3. Problem Description (وصف العطل)
                  if (offer.description != null && offer.description!.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: AppColors.inputFill(context),
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(color: AppColors.border(context)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.description_outlined, size: 18, color: AppColors.primary(context)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.tr('problem_desc'),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textSecondary(context),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  offer.description!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textPrimary(context),
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // 4. Photos Section (صور العطل المرفقة)
                  if (offer.photos.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Icon(Icons.photo_library_outlined, size: 16, color: AppColors.textSecondary(context)),
                        const SizedBox(width: 6),
                        Text(
                          '${context.tr('details')} (${offer.photos.length})',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textSecondary(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 75,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: offer.photos.length,
                        separatorBuilder: (context, i) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final url = offer.photos[index];
                          return AuthenticatedImage(
                            imageUrl: url,
                            width: 75,
                            height: 75,
                            borderRadius: BorderRadius.circular(12),
                            enableZoomOnTap: true,
                          );
                        },
                      ),
                    ),
                  ],

                  const SizedBox(height: 14),
                  Divider(height: 1, thickness: 1, color: AppColors.border(context)),
                  const SizedBox(height: 14),

                  // 5. Structured Address & Inspection Fee Card
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: AppColors.inputFill(context),
                      borderRadius: BorderRadius.circular(14.0),
                      border: Border.all(color: AppColors.border(context)),
                    ),
                    child: Column(
                      children: [
                        // Address Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEF4444).withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.location_on_rounded, size: 16, color: Color(0xFFEF4444)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    offer.addressLabel ?? context.tr('address'),
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary(context),
                                    ),
                                  ),
                                  if (offer.buildingNo != null || offer.floor != null) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      '${offer.buildingNo != null ? "بناء ${offer.buildingNo}، " : ""}${offer.floor != null ? "طابق ${offer.floor}" : ""}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary(context),
                                      ),
                                    ),
                                  ],
                                  if (offer.addressNotes != null && offer.addressNotes!.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      '${context.tr('notes')}: ${offer.addressNotes}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary(context),
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                        Divider(height: 1, color: AppColors.border(context)),
                        const SizedBox(height: 10),

                        // Financial & Fee Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.payments_outlined, size: 16, color: Color(0xFF16A34A)),
                                const SizedBox(width: 6),
                                Text(
                                  '${context.tr('inspection_fee')}: ${offer.inspectionFee ?? "50.00"} ${context.tr('currency')}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF16A34A),
                                  ),
                                ),
                              ],
                            ),
                            if (offer.commissionRate != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0284C7).withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'عمولة: ${(double.tryParse(offer.commissionRate!) != null ? (double.parse(offer.commissionRate!) * 100).toInt() : 10)}%',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0284C7),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  if (offer.scheduledAt != null) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0284C7).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.event_available_rounded, size: 16, color: Color(0xFF0284C7)),
                          const SizedBox(width: 8),
                          Text(
                            '${context.tr('scheduled')}: ${offer.scheduledAt!.year}/${offer.scheduledAt!.month.toString().padLeft(2, '0')}/${offer.scheduledAt!.day.toString().padLeft(2, '0')} - ${offer.scheduledAt!.hour.toString().padLeft(2, '0')}:${offer.scheduledAt!.minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0284C7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 18),

                  // 6. Action Buttons (Accept & Decline)
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: isProcessing
                              ? null
                              : () {
                                  context.read<HomeBloc>().add(HomeEvent.acceptOffer(offer.id));
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF003882),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            elevation: 0,
                          ),
                          child: isProcessing
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  context.tr('accept_order'),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          onPressed: isProcessing
                              ? null
                              : () {
                                  context.read<HomeBloc>().add(HomeEvent.declineOffer(offer.id));
                                },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textSecondary(context),
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            side: BorderSide(color: AppColors.border(context)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: Text(
                            context.tr('decline_order'),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
