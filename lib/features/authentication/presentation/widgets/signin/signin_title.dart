import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';


class SigninTitle extends StatelessWidget {
  const SigninTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'MExpense',
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 28,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}