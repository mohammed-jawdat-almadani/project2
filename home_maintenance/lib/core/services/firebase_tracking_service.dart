import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'firebase_auth_service.dart';
import 'location_service.dart';

@lazySingleton
class FirebaseTrackingService {
  final FirebaseAuthService _firebaseAuthService;
  final LocationService _locationService;
  final FirebaseDatabase _database;

  StreamSubscription<Position>? _trackingSubscription;
  int? _activeTrackingOrderId;
  Position? _lastPushedPosition;
  DateTime? _lastPushTime;

  FirebaseTrackingService(
    this._firebaseAuthService,
    this._locationService,
  ) : _database = FirebaseDatabase.instance;

  /// Currently active order id being tracked, if any
  int? get activeTrackingOrderId => _activeTrackingOrderId;

  /// Whether tracking stream is currently active
  bool get isTracking => _trackingSubscription != null;

  /// Starts streaming GPS location to RTDB under `orders/$orderId/location`
  Future<void> startTracking(int orderId) async {
    // If already tracking this exact order, no need to recreate stream
    if (_activeTrackingOrderId == orderId && _trackingSubscription != null) {
      return;
    }

    // Stop any existing tracking first
    stopTracking();
    _activeTrackingOrderId = orderId;

    // 1. Ensure Firebase Auth is signed in
    if (!_firebaseAuthService.isSignedIn) {
      await _firebaseAuthService.signInWithCustomToken();
    }

    // 2. Fetch and push initial location immediately
    try {
      final initialPos = await _locationService.getCurrentPosition();
      await _pushLocation(orderId, initialPos);
    } catch (_) {
      // Permission or GPS error handled gracefully
    }

    // 3. Listen to continuous GPS stream with throttled pushes
    // distanceFilter of 5m so we get granular updates, but throttle push to >=5s OR >=25m
    _trackingSubscription = _locationService
        .getPositionStream(distanceFilter: 5)
        .listen((position) async {
      final now = DateTime.now();
      final lastPos = _lastPushedPosition;
      final lastTime = _lastPushTime;

      bool shouldPush = false;
      if (lastPos == null || lastTime == null) {
        shouldPush = true;
      } else {
        final timeDiff = now.difference(lastTime).inSeconds;
        final distanceDiff = Geolocator.distanceBetween(
          lastPos.latitude,
          lastPos.longitude,
          position.latitude,
          position.longitude,
        );

        // Throttle condition: every ~5 seconds OR moved ~25 meters
        if (timeDiff >= 5 || distanceDiff >= 25) {
          shouldPush = true;
        }
      }

      if (shouldPush) {
        await _pushLocation(orderId, position);
      }
    });
  }

  /// Pushes coordinates to Firebase Realtime Database
  Future<void> _pushLocation(int orderId, Position position) async {
    try {
      if (!_firebaseAuthService.isSignedIn) {
        await _firebaseAuthService.signInWithCustomToken();
      }

      final ref = _database.ref('orders/$orderId/location');
      await ref.set({
        'lat': position.latitude,
        'lng': position.longitude,
        'heading': position.heading,
        'updated_at': ServerValue.timestamp,
      });

      _lastPushedPosition = position;
      _lastPushTime = DateTime.now();
    } catch (e) {
      // If permission denied / auth expired, attempt re-login once
      final errStr = e.toString().toLowerCase();
      if (errStr.contains('permission-denied') || errStr.contains('permission_denied')) {
        try {
          await _firebaseAuthService.signInWithCustomToken();
          final ref = _database.ref('orders/$orderId/location');
          await ref.set({
            'lat': position.latitude,
            'lng': position.longitude,
            'heading': position.heading,
            'updated_at': ServerValue.timestamp,
          });
          _lastPushedPosition = position;
          _lastPushTime = DateTime.now();
        } catch (_) {}
      }
    }
  }

  /// Stops streaming GPS to RTDB
  void stopTracking() {
    _trackingSubscription?.cancel();
    _trackingSubscription = null;
    _activeTrackingOrderId = null;
    _lastPushedPosition = null;
    _lastPushTime = null;
  }
}
