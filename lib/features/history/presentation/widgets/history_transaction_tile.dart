import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../models/history_transaction_model.dart';

class HistoryTransactionTile extends StatelessWidget {
  const HistoryTransactionTile({
    super.key,
    required this.transaction,
  });

  final HistoryTransactionModel transaction;

  bool get isIncome => transaction.type == HistoryTransactionType.income;

  @override
  Widget build(BuildContext context) {
    final amountColor = isIncome ? const Color(0xFF00B87C) : Colors.red;

    final iconBackgroundColor = isIncome
        ? AppColors.primary.withValues(alpha: 0.10)
        : AppColors.primary.withValues(alpha: 0.10);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.045),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.icon,
              color: AppColors.primary,
              size: 22,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.textTheme.titleSmall!.copyWith(
                    color: AppColors.onPrimaryBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  transaction.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.textTheme.bodySmall!.copyWith(
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Text(
            transaction.amount,
            style: AppTypography.textTheme.titleMedium!.copyWith(
              color: amountColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}