import 'package:flutter/material.dart';

import '../model/expense.dart';
import '../widgets/expenses_list/expenses_list.dart';
import '../widgets/new_expense.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Title1',
      amount: 20.3,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Title2',
      amount: 30.5,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Title3',
      amount: 25.7,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Title4',
      amount: 49.9,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => NewExpence(
                  onAddExpense: _addExpense,
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ExpensesList(expenses: _expenses),
    );
  }
}
