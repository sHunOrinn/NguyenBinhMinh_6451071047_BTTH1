import 'package:flutter/material.dart';
import '../utils/login_utils.dart';

class LoginInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const LoginInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: LoginTextStyles.label,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: LoginTextStyles.input,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: LoginTextStyles.hint,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: LoginColors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LoginColors.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}