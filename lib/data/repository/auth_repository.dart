import 'package:firebase_auth/firebase_auth.dart';

import '../services/firebase/auth_firebase_service.dart';

class AuthRepository {
  final AuthFirebaseService _authFirebaseService = AuthFirebaseService();

  User? get currentUser => _authFirebaseService.currentUser;

  Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return _authFirebaseService.login(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signup({
    required String fullName,
    required String email,
    required String password,
  }) {
    return _authFirebaseService.signup(
      fullName: fullName,
      email: email,
      password: password,
    );
  }

  Future<void> resetPassword({
    required String email,
  }) {
    return _authFirebaseService.resetPassword(
      email: email,
    );
  }

  Future<UserCredential> signInWithGoogle() {
    return _authFirebaseService.signInWithGoogle();
  }

  Future<void> logout() {
    return _authFirebaseService.logout();
  }
}