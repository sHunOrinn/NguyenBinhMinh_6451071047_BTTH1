import 'package:flutter/material.dart';

import '../../../shared/widget/remember_forgot_row.dart';
import '../../forgot_password/screens/forgot_password_view.dart';
import '../utils/signup_utils.dart';
import '../widget/signup_button.dart';
import '../widget/signup_footer.dart';
import '../widget/signup_google_button.dart';
import '../widget/signup_header.dart';
import '../widget/signup_input_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isRemember = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SignUpColors.background,
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
                      const SizedBox(height: 80),

                      const SignUpHeader(),

                      const SizedBox(height: 54),

                      const SignUpInputField(
                        label: 'Full name',
                        hintText: 'Brandone Louis',
                      ),

                      const SizedBox(height: 20),

                      const SignUpInputField(
                        label: 'Email',
                        hintText: 'Brandonelouis@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 20),

                      SignUpInputField(
                        label: 'Password',
                        hintText: '•••••••••••',
                        obscureText: !isPasswordVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: SignUpColors.hint,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      RememberForgotRow(
                        isRemember: isRemember,
                        onRememberTap: () {
                          setState(() {
                            isRemember = !isRemember;
                          });
                        },
                        onForgotTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordView(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 26),

                      SignUpButton(
                        onPressed: () {},
                      ),

                      const SizedBox(height: 16),

                      SignUpGoogleButton(
                        onPressed: () {},
                      ),

                      const SizedBox(height: 20),

                      SignUpFooter(
                        onSignInTap: () {
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