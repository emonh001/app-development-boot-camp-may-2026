import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class ResetPasswordField extends StatelessWidget {
  const ResetPasswordField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.isPasswordHidden,
    required this.onVisibilityTap,
    required this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool isPasswordHidden;
  final VoidCallback onVisibilityTap;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordHidden,
      validator: validator,
      cursorColor: AppColors.primary,
      style: AppTypography.textTheme.bodySmall!.copyWith(
        color: AppColors.onPrimaryBlack,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTypography.textTheme.titleSmall!.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        hintText: hintText,
        hintStyle: AppTypography.textTheme.bodySmall!.copyWith(
          color: AppColors.textGrey.withValues(alpha: 0.65),
        ),
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
          color: AppColors.textGrey,
        ),
        suffixIcon: GestureDetector(
          onTap: onVisibilityTap,
          behavior: HitTestBehavior.opaque,
          child: Icon(
            isPasswordHidden
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 20,
            color: AppColors.textGrey,
          ),
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
            color: AppColors.textGrey.withValues(alpha: 0.45),
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