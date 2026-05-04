import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/go_router/route_paths.dart';
import '../../controllers/signin_controller.dart';
import 'signin_title.dart';
import 'signin_text_field.dart';
import 'signin_password_field.dart';
import 'signin_button.dart';
import 'forgot_password.dart';
import 'create_account_text.dart';

class SigninForm extends StatelessWidget {
  final SigninController controller;
  final VoidCallback onSigninTap;
  final VoidCallback onCreateAccountTap;

  const SigninForm({
    super.key,
    required this.controller,
    required this.onSigninTap,
    required this.onCreateAccountTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SigninTitle(),

              const SizedBox(height: 28),

              SigninTextField(
                controller: controller.emailController,
                labelText: 'Email Address',
                hintText: 'name@example.com',
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail,
              ),

              const SizedBox(height: 18),

              SigninPasswordField(
                controller: controller.passwordController,
                labelText: 'Password',
                hintText: '••••••••',
                isHidden: controller.isPasswordHidden,
                onVisibilityTap: controller.togglePasswordVisibility,
                validator: controller.validatePassword,
              ),

              const SizedBox(height: 26),

              SigninButton(onTap: onSigninTap),

              const SizedBox(height: 18),

              ForgotPassword(onTap: (){
                context.go(RoutePaths.forgotPassword);
              },),

              const SizedBox(height: 34),

              CreateAccountText(),
            ],
          ),
        );
      },
    );
  }
}