import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class ExpenseNoteField extends StatelessWidget {
  const ExpenseNoteField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return _LabeledField(
      label: 'NOTE',
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primary,
        style: AppTypography.textTheme.bodyMedium!.copyWith(
          color: AppColors.onPrimaryBlack,
        ),
        decoration: InputDecoration(
          hintText: 'What was this for?',
          hintStyle: AppTypography.textTheme.bodyMedium!.copyWith(
            color: AppColors.textGrey,
          ),
          prefixIcon: Icon(
            Icons.notes_outlined,
            color: AppColors.textGrey,
            size: 20,
          ),
          filled: true,
          fillColor: AppColors.surfaceContainerLowest,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: AppColors.textGrey.withValues(alpha: 0.35),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.2,
            ),
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