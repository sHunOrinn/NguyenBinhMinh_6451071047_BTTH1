import 'package:flutter/material.dart';
import '../utils/signup_utils.dart';

class SignUpGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignUpGoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: SignUpColors.googleButton,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/google_icon.png'),
              width: 24,
              height: 24,
            ),
            SizedBox(width: 14),
            Text(
              'SIGN UP WITH GOOGLE',
              style: SignUpTextStyles.googleButton,
            ),
          ],
        ),
      ),
    );
  }
}