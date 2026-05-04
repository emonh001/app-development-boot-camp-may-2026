import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class AppVersionText extends StatelessWidget {
  const AppVersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'App Version 2.4.0',
      style: AppTypography.textTheme.bodySmall!.copyWith(
        color: AppColors.textGrey,
      ),
    );
  }
}