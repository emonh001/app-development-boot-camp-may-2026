import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class ForgotPasswordEmailField extends StatelessWidget {
  const ForgotPasswordEmailField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.primary,
      style: AppTypography.textTheme.bodySmall!.copyWith(
        color: AppColors.onPrimaryBlack,
      ),
      decoration: InputDecoration(
        labelText: 'Email Address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTypography.textTheme.titleSmall!.copyWith(
          color: AppColors.onPrimaryBlack,
          fontWeight: FontWeight.w600,
        ),
        hintText: 'e.g. name@company.com',
        hintStyle: AppTypography.textTheme.bodySmall!.copyWith(
          color: AppColors.textGrey.withValues(alpha: 0.45),
        ),
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 20,
          color: AppColors.textGrey,
        ),
        filled: true,
        fillColor: AppColors.surfaceContainerLowest,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: AppColors.textGrey.withValues(alpha: 0.55),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}