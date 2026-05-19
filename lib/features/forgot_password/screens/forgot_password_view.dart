import 'package:flutter/material.dart';

import '../widget/back_to_login_button.dart';
import '../widget/email_field.dart';
import '../widget/forgot_password_header.dart';
import '../widget/reset_password_button.dart';
import 'check_email_view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 80),

              const ForgotPasswordHeader(),

              const SizedBox(height: 50),

              const EmailField(
                label: 'Email',
                hintText: 'Enter your email',
              ),

              const SizedBox(height: 32),

              ResetPasswordButton(
                text: 'RESET PASSWORD',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckEmailView(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              BackToLoginButton(
                text: 'BACK TO LOGIN',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}