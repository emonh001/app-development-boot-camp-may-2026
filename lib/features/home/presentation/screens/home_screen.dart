import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_transaction_fab.dart';
import '../widgets/expense_summary_card.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/recent_transactions_header.dart';
import '../widgets/transaction_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onAddTap,
  });

  final VoidCallback onAddTap;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  void _viewAllTransactions() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('View all transactions')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const HomeAppBar(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(18, 20, 18, 110),
                    child: Column(
                      children: [
                        ExpenseSummaryCard(
                          totalExpense: controller.totalExpense,
                          remainingBudget: controller.remainingBudget,
                          monthName: controller.monthName,
                          percentageText: controller.percentageText,
                        ),

                        const SizedBox(height: 26),

                        RecentTransactionsHeader(
                          onViewAllTap: _viewAllTransactions,
                        ),

                        const SizedBox(height: 14),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.transactions.length,
                          separatorBuilder: (_, __) {
                            return const SizedBox(height: 14);
                          },
                          itemBuilder: (context, index) {
                            return TransactionTile(
                              transaction: controller.transactions[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              right: 18,
              bottom: 28,
              child: AddTransactionFab(
                onTap: widget.onAddTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}