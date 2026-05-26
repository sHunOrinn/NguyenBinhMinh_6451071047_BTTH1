import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user_model.dart';

class AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  Future<UserCredential> signup({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential =
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    final User? user = userCredential.user;

    if (user != null) {
      await user.updateDisplayName(fullName.trim());

      final UserModel userModel = UserModel.fromFirebaseUser(
        user: user,
        provider: 'password',
        fullName: fullName.trim(),
      );

      await _saveUserToFirestore(userModel);
    }

    return userCredential;
  }

  Future<void> resetPassword({
    required String email,
  }) {
    return _firebaseAuth.sendPasswordResetEmail(
      email: email.trim(),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize();

      if (!GoogleSignIn.instance.supportsAuthenticate()) {
        throw FirebaseAuthException(
          code: 'google-sign-in-not-supported',
          message: 'Thiết bị này không hỗ trợ Google Sign-In.',
        );
      }

      final GoogleSignInAccount googleUser =
      await GoogleSignIn.instance.authenticate();

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        final UserModel userModel = UserModel.fromFirebaseUser(
          user: user,
          provider: 'google',
        );

        await _saveUserToFirestore(userModel);
      }

      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw FirebaseAuthException(
        code: 'google-sign-in-failed',
        message: 'Đăng nhập Google thất bại. Vui lòng thử lại.',
      );
    }
  }

  Future<void> logout() async {
    await GoogleSignIn.instance.signOut();
    await _firebaseAuth.signOut();
  }

  Future<void> _saveUserToFirestore(UserModel userModel) async {
    final DocumentReference<Map<String, dynamic>> userRef =
    _firestore.collection('users').doc(userModel.uid);

    final DocumentSnapshot<Map<String, dynamic>> snapshot =
    await userRef.get();

    final Map<String, dynamic> data = userModel.toMap();

    data['updatedAt'] = FieldValue.serverTimestamp();
    data['lastLoginAt'] = FieldValue.serverTimestamp();

    if (!snapshot.exists) {
      data['createdAt'] = FieldValue.serverTimestamp();
    }

    await userRef.set(
      data,
      SetOptions(merge: true),
    );
  }
}