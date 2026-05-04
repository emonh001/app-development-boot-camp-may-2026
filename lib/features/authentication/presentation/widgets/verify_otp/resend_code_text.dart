import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Didn't receive the code?",
          style: AppTypography.textTheme.bodyMedium!.copyWith(
            color: AppColors.textGrey,
          ),
        ),

        const SizedBox(height: 8),

        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Text(
            'Resend Code',
            style: AppTypography.textTheme.titleSmall!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}