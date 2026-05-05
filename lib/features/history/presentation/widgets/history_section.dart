import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../expenses/presentation/data/repositories/history_group_model.dart';
import 'history_transaction_tile.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({
    super.key,
    required this.group,
  });

  final HistoryGroupModel group;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              group.title,
              style: AppTypography.textTheme.titleMedium!.copyWith(
                color: AppColors.onPrimaryBlack,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Text(
              group.totalAmount,
              style: AppTypography.textTheme.titleSmall!.copyWith(
                color: AppColors.textGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        ListView.separated(
          itemCount: group.expenses.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) {
            return const SizedBox(height: 12);
          },
          itemBuilder: (context, index) {
            return HistoryTransactionTile(
              expense: group.expenses[index],
            );
          },
        ),
      ],
    );
  }
}