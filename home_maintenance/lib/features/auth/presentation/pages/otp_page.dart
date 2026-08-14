import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
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
  int _start = 59;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _start = 59;
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

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Color(0xFF1A1B22),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        border: Border.all(color: const Color(0xFFD1D5DB)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xFF0056D2), width: 2),
      borderRadius: BorderRadius.circular(12),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: const Color(0xFFF0F5FF),
      border: Border.all(color: const Color(0xFF0056D2)),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            otpVerified: (ticket) {
              // TODO: Navigate to final step. For now, show a SnackBar or navigate to placeholder
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم التحقق بنجاح!')),
              );
              // For demonstration, you could navigate here
              // context.go('/register/client', extra: ticket);
            },
            otpSent: (debugCode) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم إرسال الرمز مجدداً. ${debugCode != null ? 'Debug Code: $debugCode' : ''}')),
              );
              _startTimer();
            },
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

          return Stack(
            children: [
              // Header
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 320, // Taller blue header
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF0056D2), // Solid blue from design
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 48), // Balance for title centering
                              const Text(
                                'التحقق من الرمز',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                                  onPressed: () => context.pop(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Main Content
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 140, left: 16, right: 16, bottom: 50),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'أدخل الرمز المكون من 4 أرقام المرسل إلى جوالك',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF747784),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
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
                          onCompleted: (pin) {
                            // Automatically trigger verification if needed
                          },
                        ),
                      ),
                      const SizedBox(height: 48),
                      PrimaryAuthButton(
                        text: 'تحقق',
                        isLoading: isLoading,
                        backgroundColor: const Color(0xFF003C9E), // Darker blue button
                        onPressed: () {
                          if (_pinController.text.length == 4) {
                            context.read<AuthBloc>().add(
                                  AuthEvent.verifyOtp(
                                    phone: widget.phone,
                                    code: _pinController.text,
                                  ),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('الرجاء إدخال الرمز كاملاً')),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 32),
                      if (!_canResend)
                        Text(
                          'إعادة إرسال الرمز بعد $_timerText',
                          style: const TextStyle(
                            color: Color(0xFF747784),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      else
                        GestureDetector(
                          onTap: () {
                            // Resend OTP
                            context.read<AuthBloc>().add(
                                  AuthEvent.registerStart(phone: widget.phone),
                                );
                          },
                          child: const Text(
                            'إعادة الإرسال',
                            style: TextStyle(
                              color: Color(0xFF0056D2),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
