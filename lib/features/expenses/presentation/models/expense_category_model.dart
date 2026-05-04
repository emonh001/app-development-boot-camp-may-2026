import 'package:flutter/material.dart';

class ExpenseCategoryModel {
  const ExpenseCategoryModel({
    required this.id,
    required this.title,
    required this.icon,
  });

  final String id;
  final String title;
  final IconData icon;
}