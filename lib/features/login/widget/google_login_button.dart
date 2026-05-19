import 'package:flutter/material.dart';
import '../utils/login_utils.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleLoginButton({
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
          backgroundColor: LoginColors.googleButton,
          foregroundColor: LoginColors.text,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/google_icon.png'),
              width: 24,
              height: 24,
            ),
            SizedBox(width: 14),
            Text(
              'SIGN IN WITH GOOGLE',
              style: LoginTextStyles.googleButton,
            ),
          ],
        ),
      ),
    );
  }
}