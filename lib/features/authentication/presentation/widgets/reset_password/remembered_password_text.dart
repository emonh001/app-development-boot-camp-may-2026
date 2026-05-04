import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class RememberedPasswordText extends StatelessWidget {
  const RememberedPasswordText({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remembered your password? ',
          style: AppTypography.textTheme.bodySmall!.copyWith(
            color: AppColors.textGrey,
          ),
        ),

        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Text(
            'Back to Sign In',
            style: AppTypography.textTheme.bodySmall!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}