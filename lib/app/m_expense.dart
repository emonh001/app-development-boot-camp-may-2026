import 'package:flutter/material.dart';
import 'package:m_expense/features/authentication/presentation/screens/splash_screen.dart';

class MExpense extends StatelessWidget {
  const MExpense({super.key});

  @override
  Widget build(context){
    return MaterialApp(
      home: const SplashScreen(),
    );
  }

}
