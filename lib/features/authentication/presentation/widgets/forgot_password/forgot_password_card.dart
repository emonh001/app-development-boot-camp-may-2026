import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../controllers/forgot_password_controller.dart';
import 'back_to_signin_text.dart';
import 'forgot_password_email_field.dart';
import 'forgot_password_header.dart';
import 'send_verification_button.dart';

class ForgotPasswordCard extends StatelessWidget {
  const ForgotPasswordCard({
    super.key,
    required this.controller,
    required this.onSendTap,
    required this.onBackToSigninTap,
  });

  final ForgotPasswordController controller;
  final VoidCallback onSendTap;
  final VoidCallback onBackToSigninTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 370),
      padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ForgotPasswordHeader(),

            const SizedBox(height: 28),

            ForgotPasswordEmailField(
              controller: controller.emailController,
              validator: controller.validateEmail,
            ),

            const SizedBox(height: 22),

            SendVerificationButton(
              onTap: onSendTap,
            ),

            const SizedBox(height: 28),

            BackToSigninText(
              onTap: onBackToSigninTap,
            ),
          ],
        ),
      ),
    );
  }
}