import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../controllers/reset_password_controller.dart';
import 'remembered_password_text.dart';
import 'reset_password_button.dart';
import 'reset_password_field.dart';
import 'reset_password_header.dart';

class ResetPasswordCard extends StatelessWidget {
  const ResetPasswordCard({
    super.key,
    required this.controller,
    required this.onResetTap,
    required this.onBackToSigninTap,
  });

  final ResetPasswordController controller;
  final VoidCallback onResetTap;
  final VoidCallback onBackToSigninTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 390),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ResetPasswordHeader(),

                const SizedBox(height: 30),

                ResetPasswordField(
                  controller: controller.newPasswordController,
                  labelText: 'New Password',
                  hintText: 'Enter new password',
                  prefixIcon: Icons.lock_outline,
                  isPasswordHidden: controller.isNewPasswordHidden,
                  onVisibilityTap: controller.toggleNewPasswordVisibility,
                  validator: controller.validateNewPassword,
                ),

                const SizedBox(height: 18),

                ResetPasswordField(
                  controller: controller.confirmPasswordController,
                  labelText: 'Confirm New Password',
                  hintText: 'Confirm new password',
                  prefixIcon: Icons.verified_user_outlined,
                  isPasswordHidden: controller.isConfirmPasswordHidden,
                  onVisibilityTap: controller.toggleConfirmPasswordVisibility,
                  validator: controller.validateConfirmPassword,
                ),

                const SizedBox(height: 28),

                ResetPasswordButton(
                  onTap: onResetTap,
                ),

                const SizedBox(height: 26),

                RememberedPasswordText(
                  onTap: onBackToSigninTap,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}