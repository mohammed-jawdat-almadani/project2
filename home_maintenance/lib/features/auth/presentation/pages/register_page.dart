import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:formz/formz.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FF),
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
                    SnackBar(content: Text('تم إرسال الرمز بنجاح. ${debugCode != null ? 'Debug Code: $debugCode' : ''}')),
                  );
                  // Pass phone from RegisterBloc state to the next page
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
                // Header
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 260,
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
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                                    onPressed: () => context.pop(),
                                  ),
                                ),
                                const Text(
                                  'تسجيل فني جديد',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 48), // Balance for title centering
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Main Content
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 226, left: 16, right: 16, bottom: 50),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 50, left: 24, right: 24, bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'حساب جديد',
                              style: TextStyle(
                                color: Color(0xFF1A1B22),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'أدخل رقم هاتفك للبدء',
                              style: TextStyle(
                                color: Color(0xFF434652),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 32),
                            AuthTextField(
                              label: '',
                              hint: 'رقم الهاتف',
                              isPhone: true,
                              onChanged: (val) => context.read<RegisterBloc>().add(RegisterEvent.phoneChanged(val)),
                              errorText: state.showErrors && state.phone.isNotValid 
                                  ? (state.phone.error == PhoneValidationError.empty 
                                      ? 'رقم الهاتف مطلوب' 
                                      : 'رقم الهاتف يجب أن يتكون من 9 أرقام ويبدأ بـ 9')
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: const Text(
                                'سنرسل لك رمز تحقق عبر رسالة نصية قصيرة.',
                                style: TextStyle(
                                  color: Color(0xFF747784),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            PrimaryAuthButton(
                              text: 'متابعة',
                              isLoading: isLoading,
                              backgroundColor: const Color(0xFF002B73),
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
