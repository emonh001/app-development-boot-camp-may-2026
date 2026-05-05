import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../expenses/presentation/data/models/expense_model.dart';

class HistoryTransactionTile extends StatelessWidget {
  const HistoryTransactionTile({
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

                const SizedBox(height: 5),

                Text(
                  '${_formatCategoryName(expense.category)} • ${_formatTime(expense.createdAt)}',
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
        return 'Food & Dining';
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

  String _formatTime(String dateText) {
    final date = DateTime.parse(dateText);

    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');

    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;

    return '$displayHour:$minute $period';
  }
}