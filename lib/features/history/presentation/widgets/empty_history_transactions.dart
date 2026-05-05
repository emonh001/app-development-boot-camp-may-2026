import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class EmptyHistoryTransactions extends StatelessWidget {
  const EmptyHistoryTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.textGrey.withValues(alpha: 0.18),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.history,
            color: AppColors.primary.withValues(alpha: 0.45),
            size: 42,
          ),

          const SizedBox(height: 12),

          Text(
            'No history found',
            style: AppTypography.textTheme.titleSmall!.copyWith(
              color: AppColors.onPrimaryBlack,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Your saved expenses will appear here.',
            textAlign: TextAlign.center,
            style: AppTypography.textTheme.bodySmall!.copyWith(
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}