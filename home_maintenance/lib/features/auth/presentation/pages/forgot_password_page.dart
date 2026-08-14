import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_auth_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            passwordResetEmailSent: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إرسال رمز الاستعادة بنجاح')),
              );
              context.pop();
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
              // Ambient Background Elements
              Positioned(
                top: -128,
                left: -128,
                child: Container(
                  width: 384,
                  height: 384,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDAE2FF).withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 64, sigmaY: 64),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                right: -100,
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4E4FE).withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 64, sigmaY: 64),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
              // Main Content
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Illustration
                        SizedBox(
                          width: 128,
                          height: 128,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDAE2FF).withValues(alpha: 0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                                  child: Container(color: Colors.transparent),
                                ),
                              ),
                              Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD1E1FB),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                    child: const Center(
                                      child: Icon(
                                        Icons.lock_reset,
                                        size: 50,
                                        color: Color(0xFF0040A1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0040A1),
                          ),
                        ),
                        const SizedBox(height: 11),
                        const Text(
                          'أدخل رقم هاتفك المسجل لنرسل لك رمز استعادة الوصول',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF424654),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Form Card (Glassmorphism inspired)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.8),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: const Color(0xFFC3C6D6).withValues(alpha: 0.3),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 6,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  AuthTextField(
                                    label: '',
                                    hint: 'رقم الهاتف',
                                    controller: _phoneController,
                                    isPhone: true,
                                  ),
                                  const SizedBox(height: 32),
                                  PrimaryAuthButton(
                                    text: 'إرسال الرمز',
                                    isLoading: isLoading,
                                    backgroundColor: const Color(0xFF0056D2),
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                            AuthEvent.forgotPassword(phone: _phoneController.text),
                                          );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
