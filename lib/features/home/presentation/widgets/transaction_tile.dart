import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../expenses/presentation/data/models/expense_model.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.expense,
    required this.currencySymbol,
  });

  final ExpenseModel expense;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) {
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
              color: AppColors.primary.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getCategoryIcon(expense.category),
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
                  _getTitle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.textTheme.titleSmall!.copyWith(
                    color: AppColors.onPrimaryBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  _formatDate(expense.date),
                  style: AppTypography.textTheme.bodySmall!.copyWith(
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Text(
            '-$currencySymbol${expense.amount.toStringAsFixed(2)}',
            style: AppTypography.textTheme.titleMedium!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    if (expense.note.trim().isNotEmpty) {
      return expense.note;
    }

    return _formatCategoryName(expense.category);
  }

  String _formatCategoryName(String category) {
    switch (category) {
      case 'food':
        return 'Food';
      case 'transport':
        return 'Transport';
      case 'shopping':
        return 'Shopping';
      case 'health':
        return 'Health';
      case 'entertainment':
        return 'Entertainment';
      case 'others':
        return 'Others';
      default:
        return category;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'food':
        return Icons.restaurant_outlined;
      case 'transport':
        return Icons.directions_car_outlined;
      case 'shopping':
        return Icons.shopping_bag_outlined;
      case 'health':
        return Icons.medical_services_outlined;
      case 'entertainment':
        return Icons.theater_comedy_outlined;
      case 'others':
        return Icons.grid_view_outlined;
      default:
        return Icons.receipt_long_outlined;
    }
  }

  String _formatDate(String dateText) {
    final date = DateTime.parse(dateText);

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final month = months[date.month - 1];
    final day = date.day.toString().padLeft(2, '0');
    final year = date.year;

    return '$month $day, $year';
  }
}