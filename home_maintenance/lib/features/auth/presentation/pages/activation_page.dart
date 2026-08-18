import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/enums/technician_status.dart';
import '../../../../core/enums/user_role.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../cubit/activation_offices_cubit.dart';
import '../cubit/activation_offices_state.dart';
import '../widgets/office_card.dart';

class ActivationPage extends StatelessWidget {
  const ActivationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActivationOfficesCubit>()..loadOffices(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  if (user.role == UserRole.technician &&
                      user.technicianStatus == TechnicianStatus.active) {
                    context.go('/');
                  } else if (user.role == UserRole.client) {
                    context.go('/');
                  }
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColors.background(context),
          body: SafeArea(
            child: RefreshIndicator(
              color: AppColors.primary(context),
              onRefresh: () async {
                context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
                await context.read<ActivationOfficesCubit>().loadOffices();
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 36.0, 20.0, 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            context.isArabic ? 'تفعيل الحساب' : 'Account Activation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary(context),
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              context.isArabic
                                  ? 'يرجى زيارة أحد مراكزنا المعتمدة أدناه لتفعيل حسابك وإكمال عملية التسجيل.'
                                  : 'Please visit one of our approved centers below to activate your account and complete registration.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.6,
                                color: AppColors.textSecondary(context),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    sliver: BlocBuilder<ActivationOfficesCubit, ActivationOfficesState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const SliverToBoxAdapter(
                            child: SizedBox(height: 200),
                          ),
                          loading: () => SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary(context),
                                ),
                              ),
                            ),
                          ),
                          error: (message) => SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      size: 48,
                                      color: Colors.redAccent,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      message,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        context.read<ActivationOfficesCubit>().loadOffices();
                                      },
                                      icon: const Icon(Icons.refresh),
                                      label: Text(context.tr('retry')),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary(context),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          loaded: (offices) {
                            if (offices.isEmpty) {
                              return SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 60.0),
                                  child: Center(
                                    child: Text(
                                      context.isArabic ? 'لا توجد مكاتب متاحة حالياً' : 'No offices currently available',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textSecondary(context),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }

                            return SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final office = offices[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16.0),
                                    child: OfficeCard(office: office),
                                  );
                                },
                                childCount: offices.length,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
