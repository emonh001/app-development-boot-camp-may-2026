import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../controllers/signin_controller.dart';
import '../signup/auth_logo.dart';
import 'signin_form.dart';

class SigninCard extends StatelessWidget {
  final SigninController controller;
  final VoidCallback onSigninTap;
  final VoidCallback onCreateAccountTap;

  const SigninCard({
    super.key,
    required this.controller,
    required this.onSigninTap,
    required this.onCreateAccountTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 370),
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 22),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AuthLogo(),

          const SizedBox(height: 14),

          SigninForm(
            controller: controller,
            onSigninTap: onSigninTap,
            onCreateAccountTap: onCreateAccountTap,
          ),
        ],
      ),
    );
  }
}