import 'package:flutter/material.dart';

enum HistoryTransactionType {
  income,
  expense,
}

class HistoryTransactionModel {
  const HistoryTransactionModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.icon,
    required this.type,
  });

  final String title;
  final String subtitle;
  final String amount;
  final IconData icon;
  final HistoryTransactionType type;
}