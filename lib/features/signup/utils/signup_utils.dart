import 'package:flutter/material.dart';

class SignUpColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF1B0066);
  static const Color text = Color(0xFF150B4D);
  static const Color hint = Color(0xFF6E6885);
  static const Color orange = Color(0xFFFCA34D);
  static const Color lightPurple = Color(0xFFE9DDFF);
  static const Color googleButton = Color(0xFFD8C8FF);
  static const Color inputBackground = Color(0xFFFAFAFA);
  static const Color rememberText = Color(0xFFAAA6B9);
}

class SignUpTextStyles {
  static const TextStyle title = TextStyle(
    color: SignUpColors.text,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle description = TextStyle(
    color: SignUpColors.hint,
    fontSize: 13,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle label = TextStyle(
    color: SignUpColors.text,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle input = TextStyle(
    color: SignUpColors.text,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle hint = TextStyle(
    color: SignUpColors.hint,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.8,
  );

  static const TextStyle googleButton = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.7,
  );

  static const TextStyle smallText = TextStyle(
    color: SignUpColors.hint,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle signIn = TextStyle(
    color: SignUpColors.orange,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    decorationColor: SignUpColors.orange,
  );
}