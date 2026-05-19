import 'package:flutter/material.dart';

import '../../forgot_password/screens/forgot_password_view.dart';
import '../utils/login_utils.dart';
import '../widget/google_login_button.dart';
import '../widget/login_header.dart';
import '../widget/login_input_field.dart';
import '../widget/login_button.dart';
import '../../../shared/widget/remember_forgot_row.dart';
import '../widget/signup_footer.dart';
import '../../signup/screens/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isRemember = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
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

                      const LoginHeader(),

                      const SizedBox(height: 58),

                      const LoginInputField(
                        label: 'Email',
                        hintText: 'Brandonelouis@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 22),

                      LoginInputField(
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
                            color: LoginColors.hint,
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

                      const SizedBox(height: 34),

                      LoginButton(
                        onPressed: () {},
                      ),

                      const SizedBox(height: 20),

                      GoogleLoginButton(
                        onPressed: () {},
                      ),

                      const SizedBox(height: 20),

                      SignupFooter(
                        onSignUpTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpView(),
                            ),
                          );
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