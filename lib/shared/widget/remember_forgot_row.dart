import 'package:flutter/material.dart';
import '../../features/login/utils/login_utils.dart';

class RememberForgotRow extends StatelessWidget {
  final bool isRemember;
  final VoidCallback onRememberTap;
  final VoidCallback onForgotTap;

  const RememberForgotRow({
    super.key,
    required this.isRemember,
    required this.onRememberTap,
    required this.onForgotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onRememberTap,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isRemember
                  ? LoginColors.primary
                  : LoginColors.lightPurple,
              borderRadius: BorderRadius.circular(6),
            ),
            child: isRemember
                ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 17,
            )
                : null,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Remember me',
          style: TextStyle(
            color: LoginColors.rememberText,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onForgotTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Forgot Password ?',
            style: TextStyle(
              color: LoginColors.text,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}