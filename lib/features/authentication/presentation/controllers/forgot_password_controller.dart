import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  String sendVerificationEmail() {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return 'Please enter a valid email address';
    }

    return '6 Digit OTP sent to your Email';
  }

  void disposeController() {
    emailController.dispose();
  }
}