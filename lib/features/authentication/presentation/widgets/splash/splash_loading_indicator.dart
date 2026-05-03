import 'package:flutter/material.dart';

class SplashLoadingIndicator extends StatelessWidget {
  const SplashLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 32.0),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1E88E5)),
        strokeWidth: 3.5,
        backgroundColor: Color(0xFFE3F2FD),
      ),
    );
  }
}