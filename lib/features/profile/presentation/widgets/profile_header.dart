import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../controllers/profile_controller.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.controller,
  });

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Column(
          children: [
            Container(
              width: 92,
              height: 92,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.textGrey.withValues(alpha: 0.25),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile_avatar.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.primary.withValues(alpha: 0.10),
                      child: Icon(
                        Icons.person,
                        color: AppColors.primary,
                        size: 46,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 14),

            if (controller.isEditingProfile) ...[
              _ProfileTextField(
                controller: controller.nameController,
                hintText: 'Enter your name',
                errorText: controller.nameErrorText,
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 10),

              _ProfileTextField(
                controller: controller.emailController,
                hintText: 'Enter your email',
                errorText: controller.emailErrorText,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
            ] else ...[
              Text(
                controller.nameController.text,
                textAlign: TextAlign.center,
                style: AppTypography.textTheme.titleLarge!.copyWith(
                  color: AppColors.onPrimaryBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                controller.emailController.text,
                textAlign: TextAlign.center,
                style: AppTypography.textTheme.bodyMedium!.copyWith(
                  color: AppColors.textGrey,
                ),
              ),
            ],

            const SizedBox(height: 12),

            GestureDetector(
              onTap: controller.toggleProfileEditing,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      controller.isEditingProfile
                          ? Icons.close
                          : Icons.edit_outlined,
                      size: 15,
                      color: AppColors.primary,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      controller.isEditingProfile ? 'Cancel Edit' : 'Edit Profile',
                      style: AppTypography.textTheme.bodySmall!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileTextField extends StatelessWidget {
  const _ProfileTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.errorText,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? errorText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.primary,
      textAlign: TextAlign.center,
      style: AppTypography.textTheme.bodyMedium!.copyWith(
        color: AppColors.onPrimaryBlack,
      ),
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          size: 18,
          color: AppColors.textGrey,
        ),
        filled: true,
        fillColor: AppColors.surfaceContainerLowest,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 13,
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