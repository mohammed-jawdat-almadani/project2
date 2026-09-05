import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';
import 'core/di/injection.dart';
import 'core/localization/app_localizations.dart';
import 'core/router/app_router.dart';
import 'core/services/fcm_service.dart';
import 'core/settings/presentation/bloc/settings_bloc.dart';
import 'core/settings/presentation/bloc/settings_event.dart';
import 'core/settings/presentation/bloc/settings_state.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/notifications/presentation/bloc/notifications_bloc.dart';
import 'features/notifications/presentation/bloc/notifications_event.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Handle background message if needed
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2. Register FCM Background Handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  // 3. Configure Dependency Injection
  configureDependencies();

  // 4. Initialize FCM Service
  await getIt<FcmService>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SettingsBloc>()..add(const SettingsEvent.loadSettings()),
        ),
        BlocProvider(
          create: (_) => getIt<AuthBloc>()..add(const AuthEvent.checkAuthStatus()),
        ),
        BlocProvider(
          create: (_) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<NotificationsBloc>()..add(const NotificationsEvent.fetchUnreadCount()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          final lang = settingsState.locale.languageCode;
          return MaterialApp.router(
            title: 'Home Maintenance',
            debugShowCheckedModeBanner: false,
            themeMode: settingsState.themeMode,
            theme: AppTheme.light(lang),
            darkTheme: AppTheme.dark(lang),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', 'AE'), // Arabic
              Locale('en', 'US'), // English
            ],
            locale: settingsState.locale,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
