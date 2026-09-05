import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../notifications/app_notification_payload.dart';
import '../notifications/notification_action_handler.dart';

@lazySingleton
class FcmService {
  final FirebaseMessaging _messaging;
  final AuthRemoteDataSource _authRemoteDataSource;
  final NotificationActionHandler _actionHandler;
  final FlutterLocalNotificationsPlugin _localNotifications;

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'home_maintenance_channel',
    'High Importance Notifications',
    description: 'This channel is used for maintenance orders and dispatch alerts.',
    importance: Importance.max,
    playSound: true,
    enableVibration: true,
  );

  FcmService(
    this._authRemoteDataSource,
    this._actionHandler,
  )   : _messaging = FirebaseMessaging.instance,
        _localNotifications = FlutterLocalNotificationsPlugin();

  String? _currentToken;
  String? get currentToken => _currentToken;

  Future<void> init() async {
    try {
      // 1. Initialize local notifications for system tray display
      const initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const initializationSettingsDarwin = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
      );

      await _localNotifications.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          if (kDebugMode) {
            print('User tapped local notification: ${details.payload}');
          }
        },
      );

      // Create Android Notification Channel
      final androidImplementation = _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (androidImplementation != null) {
        await androidImplementation.createNotificationChannel(_channel);
      }

      // 2. Request user permission from Firebase
      final settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (kDebugMode) {
        print('FCM User granted permission: ${settings.authorizationStatus}');
      }

      // 3. Set foreground presentation options
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      // 4. Get initial FCM token
      _currentToken = await _messaging.getToken();
      if (kDebugMode) {
        print('FCM Device Token: $_currentToken');
      }

      if (_currentToken != null) {
        await _syncTokenIfLoggedIn(_currentToken!);
      }

      // 5. Listen for token refresh
      _messaging.onTokenRefresh.listen((newToken) async {
        _currentToken = newToken;
        if (kDebugMode) {
          print('FCM Token Refreshed: $newToken');
        }
        await _syncTokenIfLoggedIn(newToken);
      });

      // 6. Handle foreground notifications & show system notification
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('Received FCM foreground message: ${message.notification?.title} - ${message.notification?.body}');
        }

        final title = message.notification?.title ?? message.data['title'] ?? 'إشعار جديد';
        final body = message.notification?.body ?? message.data['body'] ?? '';

        // Show local system notification
        _showSystemNotification(
          id: message.hashCode,
          title: title,
          body: body,
          payload: message.data.toString(),
        );

        final payload = AppNotificationPayload.fromMap(
          message.data,
          defaultTitle: title,
          defaultBody: body,
        );
        _actionHandler.handleIncomingPayload(payload);
      });

      // 7. Handle notification click when app is in background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('User opened notification from background: ${message.data}');
        }
        final payload = AppNotificationPayload.fromMap(
          message.data,
          defaultTitle: message.notification?.title,
          defaultBody: message.notification?.body,
        );
        _actionHandler.handleIncomingPayload(payload);
      });

      // 8. Check if app was opened directly from a notification (terminated state)
      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        if (kDebugMode) {
          print('App opened from terminated state via notification: ${initialMessage.data}');
        }
        final payload = AppNotificationPayload.fromMap(
          initialMessage.data,
          defaultTitle: initialMessage.notification?.title,
          defaultBody: initialMessage.notification?.body,
        );
        _actionHandler.handleIncomingPayload(payload);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing FCM: $e');
      }
    }
  }

  Future<void> _showSystemNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'home_maintenance_channel',
        'High Importance Notifications',
        channelDescription: 'This channel is used for maintenance orders and dispatch alerts.',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
        icon: '@mipmap/ic_launcher',
        playSound: true,
        enableVibration: true,
      );
      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      const details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _localNotifications.show(
        id,
        title,
        body,
        details,
        payload: payload,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error displaying local system notification: $e');
      }
    }
  }

  /// Manually sync token with backend (e.g. called after login)
  Future<void> syncToken() async {
    try {
      final token = _currentToken ?? await _messaging.getToken();
      if (token != null) {
        _currentToken = token;
        await _authRemoteDataSource.registerDeviceToken(
          token: token,
          platform: defaultTargetPlatform == TargetPlatform.iOS ? 'ios' : 'android',
        );
        if (kDebugMode) {
          print('FCM token successfully synced with backend.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to sync FCM token with backend: $e');
      }
    }
  }

  /// Delete device token from backend on logout
  Future<void> deleteTokenOnLogout() async {
    try {
      final token = _currentToken ?? await _messaging.getToken();
      if (token != null) {
        await _authRemoteDataSource.deleteDeviceToken(token: token);
        await _messaging.deleteToken();
        _currentToken = null;
        if (kDebugMode) {
          print('FCM token deleted on logout.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to delete FCM token on logout: $e');
      }
    }
  }

  Future<void> _syncTokenIfLoggedIn(String token) async {
    try {
      final hasToken = await _authRemoteDataSource.hasToken();
      if (hasToken) {
        await _authRemoteDataSource.registerDeviceToken(
          token: token,
          platform: defaultTargetPlatform == TargetPlatform.iOS ? 'ios' : 'android',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Could not sync token (user might not be authenticated yet): $e');
      }
    }
  }
}
