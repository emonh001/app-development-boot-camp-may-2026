import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class OtpInputBox extends StatelessWidget {
  const OtpInputBox({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.showError,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    final borderColor = showError
        ? Colors.red
        : AppColors.textGrey.withValues(alpha: 0.35);

    return SizedBox(
      width: 43,
      height: 48,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: AppColors.primary,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        style: AppTypography.textTheme.titleMedium!.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.surfaceContainerLowest,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: borderColor,
              width: showError ? 1.4 : 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: showError ? Colors.red : AppColors.primary,
              width: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}