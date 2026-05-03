import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_expense/app/go_router/route_paths.dart';
import '../../../../../app/theme/app_colors.dart';


class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(RoutePaths.signup);
      },
      child: RichText(
        text: const TextSpan(
          style: TextStyle(
            color: AppColors.textGrey,
            fontSize: 13,
          ),
          children: [
            TextSpan(text: "Don't have an account?  "),
            TextSpan(
              text: 'Create Account',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}