import 'package:flutter/material.dart';

import 'otp_input_box.dart';

class OtpInputRow extends StatelessWidget {
  const OtpInputRow({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.showError,
    required this.onOtpChanged,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final bool showError;
  final VoidCallback onOtpChanged;

  void _moveFocus({
    required BuildContext context,
    required int index,
    required String value,
  }) {
    if (value.isNotEmpty && index < focusNodes.length - 1) {
      focusNodes[index + 1].requestFocus();
      return;
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
      return;
    }

    if (index == focusNodes.length - 1) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        controllers.length,
            (index) {
          return OtpInputBox(
            controller: controllers[index],
            focusNode: focusNodes[index],
            showError: showError,
            onChanged: (value) {
              onOtpChanged();

              _moveFocus(
                context: context,
                index: index,
                value: value,
              );
            },
          );
        },
      ),
    );
  }
}