import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/settings/presentation/bloc/settings_bloc.dart';
import '../../../../core/settings/presentation/bloc/settings_event.dart';
import '../../../../core/settings/presentation/bloc/settings_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(const ProfileEvent.fetchProfile()),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.border(context),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              context.tr('language'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(context),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                final currentLang = state.locale.languageCode;
                return Column(
                  children: [
                    _buildLanguageOption(
                      context,
                      title: 'العربية (Arabic)',
                      flag: '🇸🇦',
                      isSelected: currentLang == 'ar',
                      onTap: () {
                        context.read<SettingsBloc>().add(
                              const SettingsEvent.changeLanguage('ar'),
                            );
                        Navigator.of(ctx).pop();
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildLanguageOption(
                      context,
                      title: 'English (الإنجليزية)',
                      flag: '🇬🇧',
                      isSelected: currentLang == 'en',
                      onTap: () {
                        context.read<SettingsBloc>().add(
                              const SettingsEvent.changeLanguage('en'),
                            );
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String title,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF003882).withValues(alpha: 0.08)
              : AppColors.inputFill(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF003882) : AppColors.border(context),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? const Color(0xFF003882) : AppColors.textPrimary(context),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle_rounded, color: Color(0xFF003882), size: 20),
          ],
        ),
      ),
    );
  }

  void _showThemeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.border(context),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              context.tr('theme_mode'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary(context),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                final currentMode = state.themeMode;
                return Column(
                  children: [
                    _buildThemeOption(
                      context,
                      title: context.tr('theme_light'),
                      icon: Icons.wb_sunny_rounded,
                      iconColor: const Color(0xFFD97706),
                      isSelected: currentMode == ThemeMode.light,
                      onTap: () {
                        context.read<SettingsBloc>().add(
                              const SettingsEvent.changeThemeMode(ThemeMode.light),
                            );
                        Navigator.of(ctx).pop();
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildThemeOption(
                      context,
                      title: context.tr('theme_dark'),
                      icon: Icons.nightlight_round,
                      iconColor: const Color(0xFF6366F1),
                      isSelected: currentMode == ThemeMode.dark,
                      onTap: () {
                        context.read<SettingsBloc>().add(
                              const SettingsEvent.changeThemeMode(ThemeMode.dark),
                            );
                        Navigator.of(ctx).pop();
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildThemeOption(
                      context,
                      title: context.tr('theme_system'),
                      icon: Icons.settings_brightness_rounded,
                      iconColor: const Color(0xFF64748B),
                      isSelected: currentMode == ThemeMode.system,
                      onTap: () {
                        context.read<SettingsBloc>().add(
                              const SettingsEvent.changeThemeMode(ThemeMode.system),
                            );
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color iconColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF003882).withValues(alpha: 0.08)
              : AppColors.inputFill(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF003882) : AppColors.border(context),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? const Color(0xFF003882) : AppColors.textPrimary(context),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle_rounded, color: Color(0xFF003882), size: 20),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.logout_rounded, color: Color(0xFFDC2626), size: 24),
            const SizedBox(width: 10),
            Text(
              context.tr('logout'),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        content: Text(
          context.tr('logout_confirm_desc'),
          style: const TextStyle(fontSize: 14, color: Color(0xFF475569)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(context.tr('cancel'), style: const TextStyle(color: Color(0xFF64748B))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<ProfileBloc>().add(const ProfileEvent.logout());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            child: Text(context.tr('logout'), style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showTermsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Text(
              'الشروط وسياسة الخصوصية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003882)),
            ),
            const SizedBox(height: 12),
            const Text(
              'تلتزم منصة الصيانة المنزلية بحماية خصوصية الفنيين والعملاء. تضمن المنصة سرية بيانات التواصل وتحديد الموقع فقط أثناء تفعيل حالة الاتصال لاستقبال طلبات الصيانة القريبة.\n\nيوافق الفني على الالتزام بتقديم خدمات الصيانة بأعلى معايير الجودة والأمانة المهنية وفق الأسعار المحددة.',
              style: TextStyle(fontSize: 14, color: Color(0xFF475569), height: 1.6),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(ctx).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003882),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('حسناً، فهمت'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) =>
          previous.loggedOutSuccess != current.loggedOutSuccess ||
          previous.errorMessage != current.errorMessage ||
          previous.successMessage != current.successMessage,
      listener: (context, state) {
        if (state.loggedOutSuccess) {
          context.go('/login');
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        } else if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.successMessage!),
              backgroundColor: const Color(0xFF16A34A),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
      },
      builder: (context, state) {
        final profile = state.profile;

        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: RefreshIndicator(
            color: const Color(0xFF003882),
            onRefresh: () async {
              context.read<ProfileBloc>().add(const ProfileEvent.fetchProfile());
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              slivers: [
                // 1. Premium App Bar Header with Profile Card
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF001E4D), Color(0xFF003882)],
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الملف الشخصي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: (profile?.isAvailable ?? false)
                                    ? const Color(0xFF22C55E).withValues(alpha: 0.25)
                                    : Colors.white.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: (profile?.isAvailable ?? false)
                                      ? const Color(0xFF86EFAC)
                                      : Colors.white24,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (profile?.isAvailable ?? false)
                                          ? const Color(0xFF22C55E)
                                          : const Color(0xFF94A3B8),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    (profile?.isAvailable ?? false) ? 'متاح للعمل' : 'غير متاح',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Avatar & Name Card
                        Row(
                          children: [
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: const Color(0xFF93C5FD), width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.15),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 40,
                                  color: Color(0xFF003882),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        profile?.name ?? 'فني الصيانة',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Icon(
                                        Icons.verified_rounded,
                                        color: Color(0xFF60A5FA),
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    profile?.phone ?? '',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.8),
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      profile?.status == 'active' ? 'حساب معتمد ومفعل ✅' : 'قيد المراجعة ⏳',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 2. Quick Stats Row
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            title: 'التقييم العام',
                            value: '⭐ ${profile?.ratingAvg ?? "0.00"}',
                            color: const Color(0xFFFEF3C7),
                            textColor: const Color(0xFFB45309),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildStatCard(
                            title: 'الطلبات المنجزة',
                            value: '${profile?.completedOrdersCount ?? 0} طلب',
                            color: const Color(0xFFDCFCE7),
                            textColor: const Color(0xFF15803D),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildStatCard(
                            title: 'حالة الفني',
                            value: profile?.status == 'active' ? 'نشط' : 'معلق',
                            color: const Color(0xFFEEF2FF),
                            textColor: const Color(0xFF003882),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Registered Categories / Specialties
                if (profile != null && profile.serviceCategoryNames.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.category_rounded, size: 18, color: Color(0xFF003882)),
                              SizedBox(width: 8),
                              Text(
                                'المهن والتخصصات المسجلة',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: profile.serviceCategoryNames.map((name) {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFFCBD5E1)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.02),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.handyman_rounded, size: 14, color: Color(0xFF003882)),
                                    const SizedBox(width: 6),
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF334155),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                // 4. Settings & Options Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Language Selector Tile
                          BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, settingsState) {
                              final isAr = settingsState.locale.languageCode == 'ar';
                              return _buildSettingTile(
                                icon: Icons.language_rounded,
                                iconColor: const Color(0xFF0D9488),
                                title: context.tr('language'),
                                subtitle: isAr ? 'العربية (Arabic)' : 'English',
                                onTap: () => _showLanguageSheet(context),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0D9488).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    isAr ? '🇸🇦 AR' : '🇬🇧 EN',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFF0D9488),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),

                          // Theme Mode Selector Tile
                          BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, settingsState) {
                              String themeName = context.tr('theme_light');
                              IconData themeIcon = Icons.wb_sunny_rounded;
                              if (settingsState.themeMode == ThemeMode.dark) {
                                themeName = context.tr('theme_dark');
                                themeIcon = Icons.nightlight_round;
                              } else if (settingsState.themeMode == ThemeMode.system) {
                                themeName = context.tr('theme_system');
                                themeIcon = Icons.settings_brightness_rounded;
                              }

                              return _buildSettingTile(
                                icon: themeIcon,
                                iconColor: const Color(0xFFD97706),
                                title: context.tr('theme_mode'),
                                subtitle: themeName,
                                onTap: () => _showThemeSheet(context),
                              );
                            },
                          ),
                          const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),

                          // Push Notifications Toggle
                          _buildSettingTile(
                            icon: Icons.notifications_active_outlined,
                            iconColor: const Color(0xFF003882),
                            title: context.tr('notifications_setting'),
                            subtitle: 'استقبال الإشعارات عند وصول عروض الصيانة',
                            trailing: Switch(
                              value: state.pushNotificationsEnabled,
                              onChanged: (val) {
                                context
                                    .read<ProfileBloc>()
                                    .add(ProfileEvent.togglePushNotifications(val));
                              },
                              activeTrackColor: const Color(0xFF003882),
                              activeThumbColor: Colors.white,
                            ),
                          ),
                          const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),

                          // Service Offices
                          _buildSettingTile(
                            icon: Icons.storefront_rounded,
                            iconColor: const Color(0xFF0284C7),
                            title: context.tr('select_office'),
                            subtitle: 'عرض عناوين مكاتب الدعم والتفعيل المعتمدة',
                            onTap: () {
                              context.push('/activation');
                            },
                          ),
                          const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),

                          // Terms & Privacy
                          _buildSettingTile(
                            icon: Icons.privacy_tip_outlined,
                            iconColor: const Color(0xFF7E22CE),
                            title: 'الشروط وسياسة الخصوصية',
                            subtitle: 'معلومات الاستخدام وشروط تقديم الخدمة',
                            onTap: () => _showTermsDialog(context),
                          ),
                          const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),

                          // Logout Button
                          _buildSettingTile(
                            icon: Icons.logout_rounded,
                            iconColor: const Color(0xFFDC2626),
                            title: context.tr('logout'),
                            subtitle: 'الخروج الآمن من الحساب',
                            textColor: const Color(0xFFDC2626),
                            onTap: state.isLoggingOut ? null : () => _showLogoutDialog(context),
                            trailing: state.isLoggingOut
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xFF94A3B8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    Widget? trailing,
    Color? textColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: textColor ?? const Color(0xFF1E293B),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF64748B),
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: Color(0xFF94A3B8),
          ),
      onTap: onTap,
    );
  }
}
