import 'package:flutter/material.dart';

import '../../../data/repository/auth_repository.dart';
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
  final AuthRepository authRepository = AuthRepository();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isRemember = false;
  bool isPasswordVisible = false;

  //sign up
  Future<void> signup() async {
    final String fullName = fullNameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin.'),
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mật khẩu phải có ít nhất 6 ký tự.'),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await authRepository.signup(
        fullName: fullName,
        email: email,
        password: password,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng ký thành công. Vui lòng đăng nhập.'),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

                      SignUpInputField(
                        label: 'Full name',
                        hintText: 'Brandone Louis',
                        controller: fullNameController,
                      ),

                      const SizedBox(height: 20),

                      SignUpInputField(
                        label: 'Email',
                        hintText: 'Brandonelouis@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),

                      const SizedBox(height: 20),

                      SignUpInputField(
                        label: 'Password',
                        hintText: '•••••••••••',
                        obscureText: !isPasswordVisible,
                        controller: passwordController,
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
                        onPressed: isLoading ? () {} : signup,
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