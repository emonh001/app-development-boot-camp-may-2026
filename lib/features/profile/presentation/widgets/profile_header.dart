import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 92,
          height: 92,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.textGrey.withValues(alpha: 0.25),
              width: 2,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile_avatar.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  child: Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 46,
                  ),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 14),

        Text(
          'Alex Thompson',
          style: AppTypography.textTheme.titleLarge!.copyWith(
            color: AppColors.onPrimaryBlack,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          'alex.thompson@example.com',
          style: AppTypography.textTheme.bodyMedium!.copyWith(
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}