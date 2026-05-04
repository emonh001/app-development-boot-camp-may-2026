import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class ExpenseSummaryCard extends StatelessWidget {
  const ExpenseSummaryCard({
    super.key,
    required this.totalExpense,
    required this.remainingBudget,
    required this.monthName,
    required this.percentageText,
  });

  final String totalExpense;
  final String remainingBudget;
  final String monthName;
  final String percentageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Expenses - $monthName',
            style: AppTypography.textTheme.bodyMedium!.copyWith(
              color: AppColors.textGrey,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            totalExpense,
            style: AppTypography.textTheme.headlineLarge!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF48E0A4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '↘ $percentageText',
              style: AppTypography.textTheme.bodySmall!.copyWith(
                color: AppColors.onPrimaryBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Divider(
            color: AppColors.textGrey.withValues(alpha: 0.12),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Remaining Budget',
                    style: AppTypography.textTheme.bodyMedium!.copyWith(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    remainingBudget,
                    style: AppTypography.textTheme.titleLarge!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Icon(
                Icons.currency_exchange_sharp,
                color: AppColors.primary.withValues(alpha: 0.20),
                size: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }
}