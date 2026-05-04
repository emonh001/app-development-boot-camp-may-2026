import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/history_controller.dart';
import '../widgets/history_app_bar.dart';
import '../widgets/history_search_bar.dart';
import '../widgets/history_section.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final HistoryController controller;

  @override
  void initState() {
    super.initState();
    controller = HistoryController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  void _openFilter() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Filter clicked')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            const HistoryAppBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 110),
                child: Column(
                  children: [
                    HistorySearchBar(
                      controller: controller.searchController,
                      onFilterTap: _openFilter,
                    ),

                    const SizedBox(height: 28),

                    HistorySection(
                      title: 'Today',
                      totalAmount: '-\$142.50',
                      transactions: controller.todayTransactions,
                    ),

                    const SizedBox(height: 28),

                    HistorySection(
                      title: 'Yesterday',
                      totalAmount: '+\$1,250.00',
                      transactions: controller.yesterdayTransactions,
                    ),

                    const SizedBox(height: 28),

                    HistorySection(
                      title: 'October 24',
                      totalAmount: '-\$12.99',
                      transactions: controller.octoberTransactions,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}