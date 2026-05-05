import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            cursorColor: AppColors.primary,
            style: AppTypography.textTheme.bodyMedium!.copyWith(
              color: AppColors.onPrimaryBlack,
            ),
            decoration: InputDecoration(
              hintText: 'Search transactions...',
              hintStyle: AppTypography.textTheme.bodyMedium!.copyWith(
                color: AppColors.textGrey,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.textGrey,
                size: 21,
              ),
              filled: true,
              fillColor: AppColors.surfaceContainerLowest,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 17,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.textGrey.withValues(alpha: 0.30),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 1.2,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

      ],
    );
  }
}