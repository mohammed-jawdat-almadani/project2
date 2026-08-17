import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/otp_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection.dart';
import '../../features/auth/presentation/pages/provider_register_wizard_page.dart';
import '../../features/auth/presentation/bloc/wizard/provider_register_wizard_bloc.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/activation_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
      routes: [
        GoRoute(
          path: 'otp',
          builder: (context, state) {
            final phone = state.extra as String? ?? '';
            return OtpPage(phone: phone);
          },
        ),
        GoRoute(
          path: 'provider',
          builder: (context, state) {
            final args = state.extra as Map<String, dynamic>? ?? {};
            final ticket = args['ticket'] as String? ?? '';
            final phone = args['phone'] as String? ?? '';
            return BlocProvider(
              create: (context) => getIt<ProviderRegisterWizardBloc>()..add(const ProviderRegisterWizardEvent.loadCategories()),
              child: ProviderRegisterWizardPage(ticket: ticket, phone: phone),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/activation',
      builder: (context, state) => const ActivationPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
