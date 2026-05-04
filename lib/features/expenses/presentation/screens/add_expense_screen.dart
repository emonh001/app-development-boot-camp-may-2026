import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/add_expense_controller.dart';
import '../widgets/add_expense/add_expense_app_bar.dart';
import '../widgets/add_expense/amount_input_field.dart';
import '../widgets/add_expense/category_grid.dart';
import '../widgets/add_expense/expense_date_field.dart';
import '../widgets/add_expense/expense_note_field.dart';
import '../widgets/add_expense/save_expense_button.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({
    super.key,
    required this.onBackTap,
  });

  final VoidCallback onBackTap;

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late final AddExpenseController controller;

  @override
  void initState() {
    super.initState();
    controller = AddExpenseController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    controller.changeDate(pickedDate);
  }

  void _saveExpense() {
    final message = controller.saveExpense();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            AddExpenseAppBar(
              onBackTap: widget.onBackTap,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 110),
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AmountInputField(
                            controller: controller.amountController,
                            validator: controller.validateAmount,
                          ),

                          const SizedBox(height: 30),

                          CategoryGrid(
                            categories: controller.categories,
                            selectedCategoryId: controller.selectedCategoryId,
                            onCategoryTap: controller.changeCategory,
                          ),

                          const SizedBox(height: 28),

                          ExpenseNoteField(
                            controller: controller.noteController,
                          ),

                          const SizedBox(height: 24),

                          ExpenseDateField(
                            dateText: controller.formattedDate,
                            onTap: _pickDate,
                          ),

                          const SizedBox(height: 36),

                          SaveExpenseButton(
                            onTap: _saveExpense,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}