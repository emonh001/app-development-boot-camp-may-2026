import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class ExpenseDateField extends StatelessWidget {
  const ExpenseDateField({
    super.key,
    required this.dateText,
    required this.onTap,
  });

  final String dateText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _LabeledField(
      label: 'DATE',
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 17,
          ),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: AppColors.textGrey.withValues(alpha: 0.35),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.textGrey,
                size: 20,
              ),

              const SizedBox(width: 16),

              Text(
                dateText,
                style: AppTypography.textTheme.bodyMedium!.copyWith(
                  color: AppColors.onPrimaryBlack,
                ),
              ),

              const Spacer(),

              Icon(
                Icons.calendar_month_outlined,
                color: AppColors.onPrimaryBlack,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.textTheme.titleSmall!.copyWith(
            color: AppColors.onPrimaryBlack,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}