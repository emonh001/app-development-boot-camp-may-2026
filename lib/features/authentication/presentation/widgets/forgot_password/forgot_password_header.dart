import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.14),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lock_reset_outlined,
            color: AppColors.primary,
            size: 30,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          'Forgot Password',
          style: AppTypography.textTheme.titleLarge!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "We'll send a reset link to your email.",
          textAlign: TextAlign.center,
          style: AppTypography.textTheme.bodySmall!.copyWith(
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}