import 'package:flutter/material.dart';
import '../utils/login_utils.dart';

class SignupFooter extends StatelessWidget {
  final VoidCallback onSignUpTap;

  const SignupFooter({
    super.key,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'You don’t have an account yet? ',
          style: LoginTextStyles.smallText,
        ),
        GestureDetector(
          onTap: onSignUpTap,
          child: const Text(
            'Sign up',
            style: LoginTextStyles.signUp,
          ),
        ),
      ],
    );
  }
}