import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class VerifyOtpHeader extends StatelessWidget {
  const VerifyOtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.mark_email_unread_outlined,
            color: AppColors.primary,
            size: 30,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          'Verify OTP',
          style: AppTypography.textTheme.headlineSmall?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Enter the 6-digit code sent to your email address.',
          textAlign: TextAlign.center,
          style: AppTypography.textTheme.bodySmall!.copyWith(
            color: AppColors.onPrimaryBlack,
          ),
        ),
      ],
    );
  }
}