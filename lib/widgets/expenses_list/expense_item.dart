import 'package:flutter/material.dart';

import '../../model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Id: ${expense.id}'),
            Text('Title: ${expense.title}'),
            Text('Amount: ${expense.amount}'),
            Text('Category: ${expense.category}'),
            Text('Date: ${expense.date}'),
          ],
        ),
      ),
    );
  }
}
