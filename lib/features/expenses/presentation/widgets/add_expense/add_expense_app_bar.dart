import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class AddExpenseAppBar extends StatelessWidget {
  const AddExpenseAppBar({
    super.key,
    required this.onBackTap,
  });

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
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
              color: AppColors.onPrimaryBlack,
              size: 22,
            ),
          ),

          const SizedBox(width: 24),

          Text(
            'Add Expense',
            style: AppTypography.textTheme.titleLarge!.copyWith(
              color: AppColors.onPrimaryBlack,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          Icon(
            Icons.notifications_none_outlined,
            color: AppColors.primary,
            size: 24,
          ),

          const SizedBox(width: 16),

          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary.withValues(alpha: 0.10),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile_avatar.png',
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 20,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}