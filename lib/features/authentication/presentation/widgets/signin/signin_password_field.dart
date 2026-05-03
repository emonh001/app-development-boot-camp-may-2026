import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';


class SigninPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isHidden;
  final VoidCallback onVisibilityTap;
  final String? Function(String?)? validator;

  const SigninPasswordField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isHidden,
    required this.onVisibilityTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHidden,
      validator: validator,
      cursorColor: AppColors.primary,
      style: const TextStyle(
        fontSize: 13,
        color: AppColors.textDark,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          color: AppColors.textDark,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hintText,
          fontSize: 13,
        ),
        prefixIcon: const Icon(
          Icons.lock_outline,
          size: 20,
          color: AppColors.textGrey,
        ),
        suffixIcon: GestureDetector(
          onTap: onVisibilityTap,
          child: Icon(
            isHidden
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 20,
            color: AppColors.textGrey,
          ),
        ),
        filled: true,
        fillColor: AppColors.fieldBackground,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}