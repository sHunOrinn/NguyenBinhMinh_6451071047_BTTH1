import 'package:flutter/material.dart';
import '../utils/login_utils.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Welcome Back',
          style: LoginTextStyles.title,
        ),
        SizedBox(height: 14),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing\n'
              'elit, sed do eiusmod tempor',
          textAlign: TextAlign.center,
          style: LoginTextStyles.description,
        ),
      ],
    );
  }
}