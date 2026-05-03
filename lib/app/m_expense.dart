import 'package:flutter/material.dart';
import 'package:m_expense/app/go_router/app_router.dart';
import 'package:m_expense/app/theme/app_theme.dart';

class MExpense extends StatelessWidget {
  const MExpense({super.key});

  @override
  Widget build(context){
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }

}
