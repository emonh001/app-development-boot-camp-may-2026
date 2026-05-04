import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class ProfileActionTile extends StatelessWidget {
  const ProfileActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.titleColor,
    required this.onTap,
    this.trailingIcon,
    this.trailingColor,
    this.borderColor,
  });

  final IconData icon;
  final String title;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color titleColor;
  final VoidCallback onTap;
  final IconData? trailingIcon;
  final Color? trailingColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: borderColor ?? Colors.black.withValues(alpha: 0.04),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            color: AppColors.surfaceContainerLowest,
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Text(
                  title,
                  style: AppTypography.textTheme.bodyLarge!.copyWith(
                    color: titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              if (trailingIcon != null)
                Icon(
                  trailingIcon,
                  color: trailingColor ?? AppColors.textGrey,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}