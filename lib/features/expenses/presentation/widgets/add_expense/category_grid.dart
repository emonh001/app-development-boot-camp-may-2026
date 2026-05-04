import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';
import '../../models/expense_category_model.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategoryTap,
  });

  final List<ExpenseCategoryModel> categories;
  final String selectedCategoryId;
  final ValueChanged<String> onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Category',
          style: AppTypography.textTheme.titleMedium!.copyWith(
            color: AppColors.onPrimaryBlack,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 14),

        GridView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 14,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return CategoryCard(
              category: category,
              isSelected: selectedCategoryId == category.id,
              onTap: () => onCategoryTap(category.id),
            );
          },
        ),
      ],
    );
  }
}