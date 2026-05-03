import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';

class PasswordAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isHidden;
  final VoidCallback onVisibilityTap;
  final String? Function(String?)? validator;

  const PasswordAuthTextField({
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
      obscuringCharacter: "*",
      validator: validator,
      cursorColor: AppColors.primary,
      style: const TextStyle(
        fontSize: 13,
        color: AppColors.textDark,
      ),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hintText,
          fontSize: 13,
        ),
        suffixIcon: GestureDetector(
          onTap: onVisibilityTap,
          child: Icon(
            isHidden
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 18,
            color: AppColors.hintText,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 42,
        ),
        errorStyle: const TextStyle(
          fontSize: 10,
          height: 0.9,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}