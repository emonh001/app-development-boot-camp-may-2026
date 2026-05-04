import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../models/transaction_item_model.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  final TransactionItemModel transaction;

  bool get isIncome => transaction.type == TransactionType.income;

  @override
  Widget build(BuildContext context) {
    final amountColor = isIncome ? const Color(0xFF00B87C) : Colors.red;
    final iconBackgroundColor = isIncome
        ? const Color(0xFF48E0A4)
        : AppColors.primary.withValues(alpha: 0.10);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
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
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getIcon(transaction.icon),
              color: isIncome ? AppColors.surfaceContainerLowest : AppColors.primary,
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

                const SizedBox(height: 4),

                Text(
                  transaction.date,
                  style: AppTypography.textTheme.bodySmall!.copyWith(
                    color: AppColors.textGrey,
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

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'shopping_bag':
        return Icons.shopping_bag_outlined;
      case 'restaurant':
        return Icons.restaurant_outlined;
      case 'car':
        return Icons.directions_car_outlined;
      case 'money':
        return Icons.payments_outlined;
      default:
        return Icons.receipt_long_outlined;
    }
  }
}