import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';
import '../../../../core/enums/user_role.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () => context.go('/login'),
          authenticated: (user) {
            if (user.role == UserRole.provider) {
              // Means provider is pending
              context.go('/activation');
            } else {
              // Client or active provider
              context.go('/');
            }
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home_repair_service,
                size: 100,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 24),
              Text(
                'تطبيق الصيانة المنزلية',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 48),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
