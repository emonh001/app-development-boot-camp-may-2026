import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class MonthlyBudgetField extends StatelessWidget {
  const MonthlyBudgetField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(
          icon: Icons.account_balance_wallet_outlined,
          text: 'Monthly Budget',
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: AppColors.primary,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          style: AppTypography.textTheme.bodyMedium!.copyWith(
            color: AppColors.onPrimaryBlack,
          ),
          decoration: InputDecoration(
            prefixText: '\$  ',
            prefixStyle: AppTypography.textTheme.bodyMedium!.copyWith(
              color: AppColors.textGrey,
            ),
            filled: true,
            fillColor: AppColors.surfaceContainerLowest,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                color: AppColors.textGrey.withValues(alpha: 0.35),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.2,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Set your overall spending limit for each month.',
          style: AppTypography.textTheme.bodySmall!.copyWith(
            color: AppColors.textGrey,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.onPrimaryBlack,
          size: 16,
        ),

        const SizedBox(width: 8),

        Text(
          text,
          style: AppTypography.textTheme.titleSmall!.copyWith(
            color: AppColors.onPrimaryBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}