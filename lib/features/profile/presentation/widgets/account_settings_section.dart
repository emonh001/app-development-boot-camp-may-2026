import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../controllers/profile_controller.dart';
import 'currency_dropdown_field.dart';
import 'monthly_budget_field.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({
    super.key,
    required this.controller,
    required this.onProfileChanged
  });

  final ProfileController controller;
  final VoidCallback? onProfileChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACCOUNT SETTINGS',
          style: AppTypography.textTheme.titleSmall!.copyWith(
            color: AppColors.textGrey,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),

        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              if (controller.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MonthlyBudgetField(
                    controller: controller.monthlyBudgetController,
                    onChanged: controller.changeMonthlyBudget,
                    errorText: controller.budgetErrorText,
                  ),

                  const SizedBox(height: 22),

                  CurrencyDropdownField(
                    value: controller.selectedCurrencyCode,
                    items: controller.currencies,
                    onChanged: controller.changeCurrency,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}