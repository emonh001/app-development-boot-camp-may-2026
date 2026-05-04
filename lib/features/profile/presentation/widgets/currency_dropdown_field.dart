import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class CurrencyDropdownField extends StatelessWidget {
  const CurrencyDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(
          icon: Icons.language,
          text: 'Currency Preference',
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textGrey,
          ),
          style: AppTypography.textTheme.bodyMedium!.copyWith(
            color: AppColors.onPrimaryBlack,
          ),
          decoration: InputDecoration(
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
          items: items.map((currency) {
            return DropdownMenuItem<String>(
              value: currency,
              child: Text(currency),
            );
          }).toList(),
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