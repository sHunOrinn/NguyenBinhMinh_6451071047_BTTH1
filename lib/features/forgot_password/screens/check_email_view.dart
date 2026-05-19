import 'package:flutter/material.dart';

import '../utils/forgot_password_utils.dart';
import '../widget/forgot_status_button.dart';
import 'successfully_view.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ForgotPasswordColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: constraints.maxHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      const SizedBox(height: 90),

                      const Text(
                        'Check Your Email',
                        textAlign: TextAlign.center,
                        style: ForgotPasswordTextStyles.title,
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'We have sent the reset password to the email address\n'
                            'brandonelouis@gmail.com',
                        textAlign: TextAlign.center,
                        style: ForgotPasswordTextStyles.description,
                      ),

                      const SizedBox(height: 70),

                      Image.asset(
                        'assets/images/check_email.png',
                        width: 135,
                        height: 135,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 95),

                      ForgotStatusButton(
                        text: 'OPEN YOUR EMAIL',
                        backgroundColor: ForgotPasswordColors.primary,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessfullyView(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      ForgotStatusButton(
                        text: 'BACK TO LOGIN',
                        backgroundColor: ForgotPasswordColors.lightPurple,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                      const SizedBox(height: 34),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'You have not received the email? ',
                            style: ForgotPasswordTextStyles.smallText,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Resend',
                              style: ForgotPasswordTextStyles.resend,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}