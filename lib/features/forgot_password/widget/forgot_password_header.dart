import 'package:flutter/material.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Forgot Password?',
          style: TextStyle(
            color: Color(0xFF150B4D),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 14),

        Text(
          'To reset your password, you need your email or mobile number that can be authenticated',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6E6885),
            fontSize: 12,
            height: 1.5,
          ),
        ),

        SizedBox(height: 45),

        Image(
          image: AssetImage('assets/images/forgot_password.png'),
          width: 118,
          height: 94,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}