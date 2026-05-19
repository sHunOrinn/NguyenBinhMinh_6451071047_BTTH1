import 'package:flutter/material.dart';

class LoginColors {
  static const Color background = Color(0xFFEDEDED);
  static const Color white = Colors.white;
  static const Color primary = Color(0xFF1B0066);
  static const Color text = Color(0xFF150B4D);
  static const Color hint = Color(0xFF6E6885);
  static const Color orange = Color(0xFFFCA34D);
  static const Color lightPurple = Color(0xFFE9DDFF);
  static const Color googleButton = Color(0xFFF4F4F4);
  static const Color rememberText = Color(0xFFAAA6B9);
}

class LoginTextStyles {
  static const TextStyle title = TextStyle(
    color: LoginColors.text,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle description = TextStyle(
    color: LoginColors.hint,
    fontSize: 13,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle label = TextStyle(
    color: LoginColors.text,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle input = TextStyle(
    color: LoginColors.text,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle hint = TextStyle(
    color: LoginColors.hint,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.8,
  );

  static const TextStyle googleButton = TextStyle(
    color: LoginColors.text,
    fontSize: 14,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.7,
  );

  static const TextStyle smallText = TextStyle(
    color: LoginColors.hint,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle signUp = TextStyle(
    color: LoginColors.orange,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    decorationColor: LoginColors.orange,
  );
}