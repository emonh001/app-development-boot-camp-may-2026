import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class RecentTransactionsHeader extends StatelessWidget {
  const RecentTransactionsHeader({
    super.key,
    required this.onViewAllTap,
  });

  final VoidCallback onViewAllTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Recent Transactions',
          style: AppTypography.textTheme.titleMedium!.copyWith(
            color: AppColors.onPrimaryBlack,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: onViewAllTap,
          behavior: HitTestBehavior.opaque,
          child: Text(
            'View All',
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