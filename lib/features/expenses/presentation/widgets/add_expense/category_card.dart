import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';
import '../../models/expense_category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  final ExpenseCategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
    isSelected ? AppColors.primary : AppColors.surfaceContainerLowest;

    final borderColor = isSelected
        ? AppColors.primary
        : AppColors.textGrey.withValues(alpha: 0.30);

    final iconBackgroundColor =
    isSelected ? Colors.white.withValues(alpha: 0.15) : Colors.grey.shade100;

    final iconColor = isSelected ? Colors.white : AppColors.onPrimaryBlack;
    final textColor = isSelected ? Colors.white : AppColors.onPrimaryBlack;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                color: iconColor,
                size: 22,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              category.title,
              style: AppTypography.textTheme.bodySmall!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}