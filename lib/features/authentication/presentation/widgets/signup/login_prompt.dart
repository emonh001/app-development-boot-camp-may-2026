import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: AppColors.textGrey, fontSize: 12),
        children: [
          TextSpan(
            text: 'Already have an account?  ',
            style: AppTypography.textTheme.titleSmall!.copyWith(
              color: AppColors.onPrimaryBlack,
            ),
          ),
          TextSpan(
            text: 'Login',
            style: AppTypography.textTheme.titleSmall!.copyWith(
              color: AppColors.primary,
              fontWeight: .bold,
            ),
          ),
        ],
      ),
    );
  }
}
