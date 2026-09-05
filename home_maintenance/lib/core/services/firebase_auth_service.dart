import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseAuthService {
  final Dio _dio;
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._dio) : _firebaseAuth = FirebaseAuth.instance;

  /// Authenticate with Firebase using custom token issued by the backend
  Future<void> signInWithCustomToken() async {
    try {
      final response = await _dio.post('/api/firebase/token');
      if (response.statusCode == 200) {
        final token = response.data['token'] ?? response.data['data']?['token'];
        if (token != null && token is String && token.isNotEmpty) {
          await _firebaseAuth.signInWithCustomToken(token);
        }
      }
    } catch (_) {
      // Ignored or logged gracefully
    }
  }

  /// Whether the user is currently signed in to Firebase
  bool get isSignedIn => _firebaseAuth.currentUser != null;

  /// Current Firebase UID
  String? get currentUid => _firebaseAuth.currentUser?.uid;

  /// Sign out from Firebase
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {}
  }
}
