import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:formz/formz.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_auth_button.dart';
import '../models/phone_input.dart';
import '../models/password_input.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFFBFDF9),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  context.go('/');
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
                        const Text(
                          'أهلاً بك مجدداً',
                          style: TextStyle(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
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
                                const Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    color: Color(0xFF1A1B22),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                AuthTextField(
                                  label: '',
                                  hint: 'رقم الهاتف',
                                  isPhone: true,
                                  onChanged: (val) => context.read<LoginBloc>().add(LoginEvent.phoneChanged(val)),
                                  errorText: state.showErrors && state.phone.isNotValid 
                                      ? (state.phone.error == PhoneValidationError.empty 
                                          ? 'رقم الهاتف مطلوب' 
                                          : 'رقم الهاتف يجب أن يتكون من 9 أرقام ويبدأ بـ 9')
                                      : null,
                                ),
                                const SizedBox(height: 24),
                                AuthTextField(
                                  label: 'كلمة المرور',
                                  hint: '••••••••',
                                  isPassword: true,
                                  onChanged: (val) => context.read<LoginBloc>().add(LoginEvent.passwordChanged(val)),
                                  errorText: state.showErrors && state.password.isNotValid 
                                      ? (state.password.error == PasswordValidationError.empty 
                                          ? 'كلمة المرور مطلوبة' 
                                          : state.password.error == PasswordValidationError.tooShort 
                                              ? 'كلمة المرور قصيرة جداً (8 أحرف على الأقل)' 
                                              : 'كلمة المرور يجب أن تحتوي على حروف، أرقام، ورموز')
                                      : null,
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () {
                                      context.push('/forgot-password');
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: const Text(
                                      'نسيت كلمة المرور؟',
                                      style: TextStyle(
                                        color: Color(0xFF0056D2),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                PrimaryAuthButton(
                                  text: 'دخول',
                                  isLoading: isLoading,
                                  backgroundColor: const Color(0xFF0056D2),
                                  icon: Icons.arrow_back,
                                  onPressed: () {
                                    context.read<LoginBloc>().add(const LoginEvent.submit());
                                  },
                                ),
                              ],
                            );
                          }
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Footer Area
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ليس لديك حساب؟',
                            style: TextStyle(
                              color: Color(0xFF747784),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              context.push('/register');
                            },
                            child: const Text(
                              'إنشاء حساب جديد',
                              style: TextStyle(
                                color: Color(0xFF0056D2),
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
