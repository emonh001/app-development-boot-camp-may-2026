import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/history_controller.dart';
import '../widgets/empty_history_transactions.dart';
import '../widgets/history_app_bar.dart';
import '../widgets/history_search_bar.dart';
import '../widgets/history_section.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
    required this.refreshKey,
  });

  final int refreshKey;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final HistoryController controller;

  @override
  void initState() {
    super.initState();
    controller = HistoryController();
    controller.loadHistoryData();
  }

  @override
  void didUpdateWidget(covariant HistoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.refreshKey != widget.refreshKey) {
      controller.loadHistoryData(
        searchText: controller.searchController.text,
      );
    }
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
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
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  if (controller.isLoading &&
                      controller.historyGroups.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  return RefreshIndicator(
                    color: AppColors.primary,
                    onRefresh: controller.refreshHistoryData,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 110),
                      child: Column(
                        children: [
                          HistorySearchBar(
                            controller: controller.searchController,
                            onChanged: controller.searchHistory,
                          ),

                          const SizedBox(height: 28),

                          if (controller.errorMessage != null)
                            Text(
                              controller.errorMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            )
                          else if (controller.historyGroups.isEmpty)
                            const EmptyHistoryTransactions()
                          else
                            ListView.separated(
                              itemCount: controller.historyGroups.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (_, __) {
                                return const SizedBox(height: 28);
                              },
                              itemBuilder: (context, index) {
                                return HistorySection(
                                  group: controller.historyGroups[index],
                                  currencySymbol: controller.currencySymbol,
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}