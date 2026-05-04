import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}