import 'package:expenses/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        background: Card(color: Theme.of(context).colorScheme.error),
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
