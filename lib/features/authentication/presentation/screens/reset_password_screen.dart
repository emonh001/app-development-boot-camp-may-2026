import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/go_router/route_paths.dart';
import '../../../../app/theme/app_colors.dart';
import '../controllers/reset_password_controller.dart';
import '../widgets/reset_password/reset_password_app_bar.dart';
import '../widgets/reset_password/reset_password_card.dart';
import '../widgets/reset_password/security_first_card.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final ResetPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = ResetPasswordController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  void _resetPassword() {
    final message = controller.resetPassword();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    if (message == 'Password reset successfully') {
      context.go(RoutePaths.signin);
    }
  }

  void _goBackToSignin() {
    context.go(RoutePaths.signin);
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
            ResetPasswordAppBar(
              onBackTap: _goBack,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 34),

                    ResetPasswordCard(
                      controller: controller,
                      onResetTap: _resetPassword,
                      onBackToSigninTap: _goBackToSignin,
                    ),

                    const SizedBox(height: 64),

                    const SecurityFirstCard(),

                    const SizedBox(height: 24),
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