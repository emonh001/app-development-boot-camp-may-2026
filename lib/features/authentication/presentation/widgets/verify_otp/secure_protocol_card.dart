import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_typography.dart';

class SecureProtocolCard extends StatelessWidget {
  const SecureProtocolCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 390),
      height: 132,
      decoration: BoxDecoration(
        color: AppColors.textGrey.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.lock_outline,
            size: 116,
            color: AppColors.textGrey.withValues(alpha: 0.18),
          ),

          Positioned(
            bottom: 22,
            child: Text(
              'Secure transaction verification protocol\nenabled',
              textAlign: TextAlign.center,
              style: AppTypography.textTheme.bodySmall!.copyWith(
                color: AppColors.textGrey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}