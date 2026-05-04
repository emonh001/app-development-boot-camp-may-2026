import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_expense/features/common/presentation/widgets/show_snackbar.dart';

import '../../../../app/go_router/route_paths.dart';
import '../../../../app/theme/app_colors.dart';
import '../controllers/verify_otp_controller.dart';
import '../widgets/verify_otp/secure_protocol_card.dart';
import '../widgets/verify_otp/verify_otp_app_bar.dart';
import '../widgets/verify_otp/verify_otp_card.dart';
import '../widgets/verify_otp/resend_code_text.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late final VerifyOtpController controller;

  @override
  void initState() {
    super.initState();
    controller = VerifyOtpController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  void _verifyOtp() {
    final message = controller.verifyOtp();
    ShowSnackbar.showMessage(context, message);
  }

  void _resendCode() {
    controller.clearOtp();
    ShowSnackbar.showMessage(context, "Verification code resent");
  }

  void _goBack() {
    if (context.canPop()) {
      context.pop();
      return;
    }

    context.go(RoutePaths.signin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            VerifyOtpAppBar(
              onBackTap: _goBack,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 54),

                    VerifyOtpCard(
                      controller: controller,
                      onVerifyTap: _verifyOtp,
                    ),

                    const SizedBox(height: 32),

                    ResendCodeText(
                      onTap: _resendCode,
                    ),

                    const SizedBox(height: 88),

                    const SecureProtocolCard(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}