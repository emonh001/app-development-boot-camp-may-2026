import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../controllers/verify_otp_controller.dart';
import 'otp_input_row.dart';
import 'verify_button.dart';
import 'verify_otp_header.dart';

class VerifyOtpCard extends StatelessWidget {
  const VerifyOtpCard({
    super.key,
    required this.controller,
    required this.onVerifyTap,
  });

  final VerifyOtpController controller;
  final VoidCallback onVerifyTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 390),
          padding: const EdgeInsets.fromLTRB(18, 26, 18, 16),
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
                const VerifyOtpHeader(),

                const SizedBox(height: 24),

                OtpInputRow(
                  controllers: controller.otpControllers,
                  focusNodes: controller.focusNodes,
                  showError: controller.showOtpError,
                  onOtpChanged: controller.handleOtpChanged,
                ),

                const SizedBox(height: 18),

                VerifyButton(
                  onTap: onVerifyTap,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}