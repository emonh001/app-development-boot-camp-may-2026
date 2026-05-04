import 'package:flutter/material.dart';

class ResetPasswordController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void toggleNewPasswordVisibility() {
    isNewPasswordHidden = !isNewPasswordHidden;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    notifyListeners();
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'New password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  String resetPassword() {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return 'Please enter valid password information';
    }

    return 'Password reset successfully';
  }

  void disposeController() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}