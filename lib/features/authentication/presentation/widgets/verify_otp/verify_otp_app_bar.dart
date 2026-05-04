import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class VerifyOtpAppBar extends StatelessWidget {
  const VerifyOtpAppBar({
    super.key,
    required this.onBackTap,
  });

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackTap,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.arrow_back,
              color: AppColors.primary,
              size: 22,
            ),
          ),

          const SizedBox(width: 20),

          Text(
            'MExpense',
            style: AppTypography.textTheme.titleMedium!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}