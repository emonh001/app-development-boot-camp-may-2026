import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppShadows {
  AppShadows._();

  // Level 1: Cards & Containers
  static final card = [
    BoxShadow(
      color: AppColors.cardShadow,
      blurRadius: 10,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  static final cardHover = [
    BoxShadow(
      color: AppColors.cardShadow,
      blurRadius: 15,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  // Level 2: Elevated Elements (Modals, FAB)
  static final elevated = [
    BoxShadow(
      color: AppColors.elevatedShadow,
      blurRadius: 15,
      offset: const Offset(0, 4),
      spreadRadius: 2,
    ),
  ];

  static final elevatedHover = [
    BoxShadow(
      color: AppColors.elevatedShadow,
      blurRadius: 20,
      offset: const Offset(0, 8),
      spreadRadius: 4,
    ),
  ];

  // Level 3: Top level (Dialogs)
  static final dialog = [
    BoxShadow(
      color: AppColors.elevatedShadow,
      blurRadius: 20,
      offset: const Offset(0, 8),
      spreadRadius: 4,
    ),
  ];

  // Specific component shadows
  static final fab = [
    BoxShadow(
      color: AppColors.elevatedShadow,
      blurRadius: 12,
      offset: const Offset(0, 4),
      spreadRadius: 2,
    ),
  ];

  static final bottomSheet = [
    BoxShadow(
      color: AppColors.elevatedShadow,
      blurRadius: 20,
      offset: const Offset(0, -4),
      spreadRadius: 2,
    ),
  ];
}