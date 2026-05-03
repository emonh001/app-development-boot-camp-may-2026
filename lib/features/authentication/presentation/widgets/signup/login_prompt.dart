import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?  ',
            style: AppTypography.textTheme.titleSmall!.copyWith(
              color: AppColors.onPrimaryBlack,
            ),
          ),
          Text(
            'Sign In',
            style: AppTypography.textTheme.titleSmall!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}