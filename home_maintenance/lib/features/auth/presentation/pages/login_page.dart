import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:formz/formz.dart';
import '../../../../core/enums/technician_status.dart';
import '../../../../core/enums/user_role.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../models/password_input.dart';
import '../models/phone_input.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_auth_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const _LoginPageView(),
    );
  }
}

class _LoginPageView extends StatefulWidget {
  const _LoginPageView();

  @override
  State<_LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<_LoginPageView> {
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
                  if (user.role == UserRole.technician && user.technicianStatus != TechnicianStatus.active) {
                    context.go('/activation');
                  } else {
                    context.go('/');
                  }
                },
                error: (msg) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status == FormzSubmissionStatus.success) {
                context.read<AuthBloc>().add(
                  AuthEvent.login(
                    phone: state.phone.value,
                    password: state.password.value,
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
                  height: 420,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0056D2), Color(0xFF0A3D80)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(48),
                        bottomRight: Radius.circular(48),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 24,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                              child: const Center(
                                child: Icon(Icons.handyman, color: Colors.white, size: 32),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          context.tr('welcome_back'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Main Content Area
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 280, left: 16, right: 16, bottom: 50),
                  child: Column(
                    children: [
                      // Floating Login Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.surface(context),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                            BoxShadow(
                              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
                              blurRadius: 40,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.tr('login'),
                                  style: TextStyle(
                                    color: AppColors.textPrimary(context),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                AuthTextField(
                                  label: '',
                                  hint: context.tr('phone_number'),
                                  isPhone: true,
                                  onChanged: (val) => context.read<LoginBloc>().add(LoginEvent.phoneChanged(val)),
                                  errorText: state.showErrors && state.phone.isNotValid
                                      ? (state.phone.error == PhoneValidationError.empty
                                          ? (context.isArabic ? 'رقم الهاتف مطلوب' : 'Phone is required')
                                          : (context.isArabic ? 'رقم الهاتف يجب أن يتكون من 9 أرقام ويبدأ بـ 9' : 'Phone must be 9 digits starting with 9'))
                                      : null,
                                ),
                                const SizedBox(height: 24),
                                AuthTextField(
                                  label: context.tr('password'),
                                  hint: '••••••••',
                                  isPassword: true,
                                  onChanged: (val) => context.read<LoginBloc>().add(LoginEvent.passwordChanged(val)),
                                  errorText: state.showErrors && state.password.isNotValid
                                      ? (state.password.error == PasswordValidationError.empty
                                          ? (context.isArabic ? 'كلمة المرور مطلوبة' : 'Password is required')
                                          : state.password.error == PasswordValidationError.tooShort
                                              ? (context.isArabic ? 'كلمة المرور قصيرة جداً (8 أحرف على الأقل)' : 'Password too short (min 8)')
                                              : (context.isArabic ? 'كلمة المرور يجب أن تحتوي على حروف، أرقام، ورموز' : 'Password must contain letters and numbers'))
                                      : null,
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: context.isRtl ? Alignment.centerLeft : Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      context.push('/forgot-password');
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      context.isArabic ? 'نسيت كلمة المرور؟' : 'Forgot Password?',
                                      style: TextStyle(
                                        color: AppColors.primary(context),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                PrimaryAuthButton(
                                  text: context.tr('login'),
                                  isLoading: isLoading,
                                  backgroundColor: const Color(0xFF0056D2),
                                  icon: context.isRtl ? Icons.arrow_back : Icons.arrow_forward,
                                  onPressed: () {
                                    context.read<LoginBloc>().add(const LoginEvent.submit());
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Footer Area
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.isArabic ? 'ليس لديك حساب؟' : "Don't have an account?",
                            style: TextStyle(
                              color: AppColors.textSecondary(context),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              context.push('/register');
                            },
                            child: Text(
                              context.isArabic ? 'إنشاء حساب جديد' : 'Register Now',
                              style: TextStyle(
                                color: AppColors.primary(context),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
