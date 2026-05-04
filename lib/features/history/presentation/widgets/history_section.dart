import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../models/history_transaction_model.dart';
import 'history_transaction_tile.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({
    super.key,
    required this.title,
    required this.totalAmount,
    required this.transactions,
  });

  final String title;
  final String totalAmount;
  final List<HistoryTransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppTypography.textTheme.titleMedium!.copyWith(
                color: AppColors.onPrimaryBlack,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Text(
              totalAmount,
              style: AppTypography.textTheme.titleSmall!.copyWith(
                color: AppColors.textGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        ListView.separated(
          itemCount: transactions.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return HistoryTransactionTile(
              transaction: transactions[index],
            );
          },
        ),
      ],
    );
  }
}