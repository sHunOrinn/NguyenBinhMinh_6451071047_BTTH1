import 'package:flutter/material.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../router/app_router.dart';
import '../widget/back_to_login_button.dart';
import '../widget/email_field.dart';
import '../widget/forgot_password_header.dart';
import '../widget/reset_password_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final AuthRepository authRepository = AuthRepository();
  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  Future<void> resetPassword() async {
    final String email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập email.'),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await authRepository.resetPassword(email: email);

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.checkEmail,
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

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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

              EmailField(
                label: 'Email',
                hintText: 'Enter your email',
                controller: emailController,
              ),

              const SizedBox(height: 32),

              ResetPasswordButton(
                text: isLoading ? 'PLEASE WAIT...' : 'RESET PASSWORD',
                onPressed: isLoading ? () {} : resetPassword,
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