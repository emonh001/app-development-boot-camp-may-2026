import 'package:flutter/material.dart';

class VerifyOtpController extends ChangeNotifier {
  static const int otpLength = 6;

  final formKey = GlobalKey<FormState>();

  final List<TextEditingController> otpControllers = List.generate(
    otpLength,
        (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(
    otpLength,
        (_) => FocusNode(),
  );

  bool showOtpError = false;

  String get otpCode {
    return otpControllers.map((controller) => controller.text).join();
  }

  void handleOtpChanged() {
    if (showOtpError) {
      showOtpError = false;
      notifyListeners();
    }
  }

  void clearOtp() {
    for (final controller in otpControllers) {
      controller.clear();
    }

    showOtpError = false;
    focusNodes.first.requestFocus();
    notifyListeners();
  }

  String verifyOtp() {
    if (otpCode.length < otpLength) {
      showOtpError = true;
      notifyListeners();
      return 'Please enter the 6-digit code';
    }

    showOtpError = false;
    notifyListeners();
    return 'OTP verified successfully';
  }

  void disposeController() {
    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
  }
}