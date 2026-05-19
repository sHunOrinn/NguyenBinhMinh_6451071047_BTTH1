import 'package:flutter/material.dart';

import '../utils/forgot_password_utils.dart';
import '../widget/forgot_status_button.dart';

class SuccessfullyView extends StatelessWidget {
  const SuccessfullyView({super.key});

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
                        'Successfully',
                        textAlign: TextAlign.center,
                        style: ForgotPasswordTextStyles.title,
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'Your password has been updated, please change your\n'
                            'password regularly to avoid this happening',
                        textAlign: TextAlign.center,
                        style: ForgotPasswordTextStyles.description,
                      ),

                      const SizedBox(height: 70),

                      Image.asset(
                        'assets/images/successfully.png',
                        width: 145,
                        height: 145,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 95),

                      ForgotStatusButton(
                        text: 'CONTINUE',
                        backgroundColor: ForgotPasswordColors.primary,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
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