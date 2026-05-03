import 'package:flutter/material.dart';

class SplashController {
  final TickerProvider vsync;

  late AnimationController animationController;
  late Animation<double> fadeInLogo;
  late Animation<double> scaleLogo;

  SplashController({required this.vsync}) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: vsync,
    );

    fadeInLogo = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    scaleLogo = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic),
    );
  }

  void startAnimation() {
    animationController.forward();
  }

  void dispose() {
    animationController.dispose();
  }
}