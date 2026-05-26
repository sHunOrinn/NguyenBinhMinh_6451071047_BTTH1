import 'package:flutter/material.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../router/app_router.dart';
import '../../forgot_password/screens/forgot_password_view.dart';
import '../utils/login_utils.dart';
import '../widget/google_login_button.dart';
import '../widget/login_header.dart';
import '../widget/login_input_field.dart';
import '../widget/login_button.dart';
import '../../../shared/widget/remember_forgot_row.dart';
import '../widget/signup_footer.dart';
import '../../signup/screens/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthRepository authRepository = AuthRepository();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isRemember = false;
  bool isPasswordVisible = false;

  // login
  Future<void> login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập email và mật khẩu.'),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await authRepository.login(
        email: email,
        password: password,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập thành công.'),
        ),
      );

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
      );
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

  Future<void> loginWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      await authRepository.signInWithGoogle();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập Google thành công.'),
        ),
      );

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Đăng nhập Google thất bại.'),
        ),
      );
    } on FirebaseException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Lỗi Firebase. Vui lòng thử lại.'),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập Google thất bại. Vui lòng thử lại.'),
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

                      LoginInputField(
                        label: 'Email',
                        hintText: 'Brandonelouis@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
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
                        controller: passwordController,
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
                          Navigator.pushNamed(context, AppRoutes.forgotPassword);
                        },
                      ),

                      const SizedBox(height: 34),

                      LoginButton(
                        onPressed: isLoading ? () {} : login,
                      ),

                      const SizedBox(height: 20),

                      GoogleLoginButton(
                        onPressed: isLoading ? () {} : loginWithGoogle,
                      ),

                      const SizedBox(height: 20),

                      SignupFooter(
                        onSignUpTap: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
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