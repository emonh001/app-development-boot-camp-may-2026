import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';
import '../../controllers/signup_controller.dart';
import 'auth_logo.dart';
import 'custom_auth_text_field.dart';
import 'password_auth_text_field.dart';
import 'terms_checkbox.dart';
import 'signup_button.dart';
import 'login_prompt.dart';

class SignupCard extends StatelessWidget {
  final SignupController controller;
  final VoidCallback onSignupTap;

  const SignupCard({
    super.key,
    required this.controller,
    required this.onSignupTap,
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
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AuthLogo(),

                const SizedBox(height: 14),

                Text(
                  'Create Account',
                  style: AppTypography.textTheme.headlineMedium,
                ),

                const SizedBox(height: 6),

                const Text(
                  'Start managing your expenses with ease',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 22),

                CustomAuthTextField(
                  controller: controller.firstNameController,
                  labelText: 'First Name',
                  hintText: 'John',
                  validator: controller.validateFirstName,
                ),

                const SizedBox(height: 12),

                CustomAuthTextField(
                  controller: controller.lastNameController,
                  labelText: 'Last Name',
                  hintText: 'Doe',
                  validator: controller.validateLastName,
                ),

                const SizedBox(height: 12),

                CustomAuthTextField(
                  controller: controller.emailController,
                  labelText: 'Email',
                  hintText: 'name@example.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                ),

                const SizedBox(height: 12),

                PasswordAuthTextField(
                  controller: controller.passwordController,
                  labelText: 'Password',
                  hintText: '*******',
                  isHidden: controller.isPasswordHidden,
                  onVisibilityTap: controller.togglePasswordVisibility,
                  validator: controller.validatePassword,
                ),

                const SizedBox(height: 12),

                PasswordAuthTextField(
                  controller: controller.confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: '*******',
                  isHidden: controller.isConfirmPasswordHidden,
                  onVisibilityTap: controller.toggleConfirmPasswordVisibility,
                  validator: controller.validateConfirmPassword,
                ),

                const SizedBox(height: 12),

                TermsCheckbox(
                  value: controller.isTermsAccepted,
                  onChanged: controller.toggleTerms,
                ),

                const SizedBox(height: 18),

                SignupButton(onTap: onSignupTap),

                const SizedBox(height: 24),

                const LoginPrompt(),
              ],
            ),
          );
        },
      ),
    );
  }
}