import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.lock_reset_outlined,
                color: Colors.white,
                size: 42,
              ),
            ),

            Positioned(
              top: -2,
              right: -4,
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF52E0A3),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.security,
                  color: AppColors.primary,
                  size: 15,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        Text(
          'Secure Your Account',
          style: AppTypography.textTheme.headlineSmall?.copyWith(
            color: AppColors.onPrimaryBlack,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          'Please enter your new password below.',
          textAlign: TextAlign.center,
          style: AppTypography.textTheme.bodyMedium!.copyWith(
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}