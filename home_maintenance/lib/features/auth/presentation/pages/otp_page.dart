import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/primary_auth_button.dart';

class OtpPage extends StatefulWidget {
  final String phone;

  const OtpPage({super.key, required this.phone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  Timer? _timer;
  int _start = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _start = 60;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _canResend = true;
          });
          timer.cancel();
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String get _timerText {
    final seconds = _start.toString().padLeft(2, '0');
    return '00:$seconds';
  }

  void _submitCode() {
    if (_pinController.text.length == 4) {
      context.read<AuthBloc>().add(
            AuthEvent.verifyOtp(
              phone: widget.phone,
              code: _pinController.text.trim(),
            ),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.tr('enter_complete_code')),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: TextStyle(
        fontSize: 24,
        color: AppColors.textPrimary(context),
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputFill(context),
        border: Border.all(color: AppColors.border(context), width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      border: Border.all(color: AppColors.primary(context), width: 2),
      borderRadius: BorderRadius.circular(16),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: isDark
          ? const Color(0xFF0284C7).withValues(alpha: 0.15)
          : const Color(0xFFE0F2FE),
      border: Border.all(color: AppColors.primary(context), width: 1.5),
    );

    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            otpVerified: (ticket) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.tr('otp_verified_success')),
                  backgroundColor: const Color(0xFF16A34A),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              );
              context.go('/register/provider', extra: {
                'ticket': ticket,
                'phone': widget.phone,
              });
            },
            otpSent: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.tr('otp_resent_success')),
                  backgroundColor: const Color(0xFF16A34A),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              );
              _startTimer();
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                  backgroundColor: Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

          return Stack(
            children: [
              // 1. Premium Blue Header
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 280,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
                          : [const Color(0xFF003882), const Color(0xFF002255)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              context.isRtl ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () => context.pop(),
                          ),
                          Text(
                            context.tr('otp_verification'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 48), // Balance for title centering
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 2. Main Content Card
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 130, left: 16, right: 16, bottom: 40),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                  decoration: BoxDecoration(
                    color: AppColors.surface(context),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppColors.border(context)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SMS Icon
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary(context).withValues(alpha: 0.12),
                        ),
                        child: Icon(
                          Icons.sms_outlined,
                          size: 36,
                          color: AppColors.primary(context),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Description
                      Text(
                        context.tr('otp_sent_sms_desc'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textSecondary(context),
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Phone Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.inputFill(context),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.border(context)),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            widget.phone,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary(context),
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // PIN Code Input (4 digits)
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 4,
                          controller: _pinController,
                          focusNode: _focusNode,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          autofocus: true,
                          onCompleted: (pin) {
                            _submitCode();
                          },
                        ),
                      ),
                      const SizedBox(height: 36),

                      // Verify Button
                      PrimaryAuthButton(
                        text: context.tr('verify_code_action'),
                        isLoading: isLoading,
                        backgroundColor: const Color(0xFF003882),
                        onPressed: _submitCode,
                      ),
                      const SizedBox(height: 28),

                      // Resend OTP Row / Timer
                      if (!_canResend) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 16,
                              color: AppColors.textSecondary(context),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${context.tr('resend_code_in')} $_timerText',
                              style: TextStyle(
                                color: AppColors.textSecondary(context),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        TextButton.icon(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  AuthEvent.registerStart(phone: widget.phone),
                                );
                          },
                          icon: Icon(Icons.refresh_rounded, size: 18, color: AppColors.primary(context)),
                          label: Text(
                            context.tr('resend_now'),
                            style: TextStyle(
                              color: AppColors.primary(context),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
