import 'package:flutter/material.dart';
import 'package:m_expense/app/theme/app_typography.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'MExpense',
          style: AppTypography.textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Effortless financial clarity.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}