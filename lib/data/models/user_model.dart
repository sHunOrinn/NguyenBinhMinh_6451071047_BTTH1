import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final String provider;
  final String role;
  final String status;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.provider,
    this.role = 'user',
    this.status = 'active',
  });

  factory UserModel.fromFirebaseUser({
    required User user,
    required String provider,
    String? fullName,
  }) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: fullName ?? user.displayName ?? 'Người dùng',
      photoUrl: user.photoURL ?? '',
      provider: provider,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoUrl,
      'provider': provider,
      'role': role,
      'status': status,
    };
  }
}