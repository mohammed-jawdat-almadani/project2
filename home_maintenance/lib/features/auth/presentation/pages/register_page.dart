import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:formz/formz.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/register/register_bloc.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_auth_button.dart';
import '../models/phone_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: const _RegisterPageView(),
    );
  }
}

class _RegisterPageView extends StatefulWidget {
  const _RegisterPageView();

  @override
  State<_RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<_RegisterPageView> {
  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  context.go('/');
                },
                otpSent: (debugCode) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${context.isArabic ? "تم إرسال الرمز بنجاح." : "Code sent successfully."} ${debugCode != null ? 'Debug Code: $debugCode' : ''}')),
                  );
                  final phone = context.read<RegisterBloc>().state.phone.value;
                  context.push('/register/otp', extra: phone);
                },
                error: (msg) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<RegisterBloc, RegisterState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status == FormzSubmissionStatus.success) {
                context.read<AuthBloc>().add(
                  AuthEvent.registerStart(
                    phone: state.phone.value,
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            final isLoading = authState.maybeWhen(loading: () => true, orElse: () => false);
            
            return Stack(
              children: [
                // Header Gradient
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 260,
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
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                context.isRtl ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () => context.pop(),
                            ),
                            Text(
                              context.isArabic ? 'تسجيل فني جديد' : 'New Technician Registration',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 48),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Main Content Card
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 226, left: 16, right: 16, bottom: 50),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 24),
                    decoration: BoxDecoration(
                      color: AppColors.surface(context),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.border(context)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              context.isArabic ? 'حساب جديد' : 'Create Account',
                              style: TextStyle(
                                color: AppColors.textPrimary(context),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              context.isArabic ? 'أدخل رقم هاتفك للبدء' : 'Enter your phone number to get started',
                              style: TextStyle(
                                color: AppColors.textSecondary(context),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 32),
                            AuthTextField(
                              label: '',
                              hint: context.isArabic ? 'رقم الهاتف' : 'Phone Number',
                              isPhone: true,
                              onChanged: (val) => context.read<RegisterBloc>().add(RegisterEvent.phoneChanged(val)),
                              errorText: state.showErrors && state.phone.isNotValid 
                                  ? (state.phone.error == PhoneValidationError.empty 
                                      ? (context.isArabic ? 'رقم الهاتف مطلوب' : 'Phone number is required') 
                                      : (context.isArabic ? 'رقم الهاتف يجب أن يتكون من 9 أرقام ويبدأ بـ 9' : 'Phone must be 9 digits starting with 9'))
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: context.isRtl ? Alignment.centerRight : Alignment.centerLeft,
                              child: Text(
                                context.isArabic ? 'سنرسل لك رمز تحقق عبر رسالة نصية قصيرة.' : 'We will send you a verification code via SMS.',
                                style: TextStyle(
                                  color: AppColors.textMuted(context),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            PrimaryAuthButton(
                              text: context.isArabic ? 'متابعة' : 'Continue',
                              isLoading: isLoading,
                              backgroundColor: const Color(0xFF003882),
                              onPressed: () {
                                context.read<RegisterBloc>().add(const RegisterEvent.submit());
                              },
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
