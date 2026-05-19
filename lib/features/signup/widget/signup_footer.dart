import 'package:flutter/material.dart';
import '../utils/signup_utils.dart';

class SignUpFooter extends StatelessWidget {
  final VoidCallback onSignInTap;

  const SignUpFooter({
    super.key,
    required this.onSignInTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'You already have an account? ',
          style: SignUpTextStyles.smallText,
        ),
        GestureDetector(
          onTap: onSignInTap,
          child: const Text(
            'Sign in',
            style: SignUpTextStyles.signIn,
          ),
        ),
      ],
    );
  }
}