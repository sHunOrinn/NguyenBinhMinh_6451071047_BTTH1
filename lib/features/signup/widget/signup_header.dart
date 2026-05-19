import 'package:flutter/material.dart';
import '../utils/signup_utils.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Sign Up',
          style: SignUpTextStyles.title,
        ),
        SizedBox(height: 14),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing\n'
              'elit, sed do eiusmod tempor',
          textAlign: TextAlign.center,
          style: SignUpTextStyles.description,
        ),
      ],
    );
  }
}