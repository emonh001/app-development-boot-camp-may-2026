import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_expense/features/common/presentation/widgets/show_snackbar.dart';

import '../../../../app/go_router/route_paths.dart';
import '../../../../app/theme/app_colors.dart';
import '../controllers/forgot_password_controller.dart';
import '../widgets/forgot_password/forgot_password_card.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = ForgotPasswordController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  void _sendVerificationEmail() {
    final message = controller.sendVerificationEmail();
    ShowSnackbar.showMessage(context, message);

    if (message == '6 Digit OTP sent to your Email') {
      context.go(RoutePaths.verifyOtp);
    }
  }

  void _goBackToSignin() {
    context.go(RoutePaths.signin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ForgotPasswordCard(
              controller: controller,
              onSendTap: _sendVerificationEmail,
              onBackToSigninTap: _goBackToSignin,
            ),
          ),
        ),
      ),
    );
  }
}