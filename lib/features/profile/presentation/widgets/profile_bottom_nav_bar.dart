import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class ProfileBottomNavBar extends StatelessWidget {
  const ProfileBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.10),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(
            icon: Icons.home_outlined,
            label: 'Home',
            isSelected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          _BottomNavItem(
            icon: Icons.add_circle_outline,
            label: 'Add',
            isSelected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
          _BottomNavItem(
            icon: Icons.history,
            label: 'History',
            isSelected: selectedIndex == 2,
            onTap: () => onTap(2),
          ),
          _BottomNavItem(
            icon: Icons.person_outline,
            label: 'Profile',
            isSelected: selectedIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? Colors.white : AppColors.onPrimaryBlack;
    final textColor = isSelected ? Colors.white : AppColors.onPrimaryBlack;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 58,
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 21,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: AppTypography.textTheme.bodySmall!.copyWith(
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}