import 'package:flutter/material.dart';

class ForgotPasswordColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF1B0066);
  static const Color text = Color(0xFF150B4D);
  static const Color hint = Color(0xFF6E6885);
  static const Color lightPurple = Color(0xFFD8C8FF);
  static const Color orange = Color(0xFFFCA34D);
}

class ForgotPasswordTextStyles {
  static const TextStyle title = TextStyle(
    color: ForgotPasswordColors.text,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle description = TextStyle(
    color: ForgotPasswordColors.hint,
    fontSize: 13,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.8,
  );

  static const TextStyle smallText = TextStyle(
    color: ForgotPasswordColors.text,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle resend = TextStyle(
    color: ForgotPasswordColors.orange,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    decorationColor: ForgotPasswordColors.orange,
  );
}