import 'package:flutter/material.dart';

import '../enum/category.dart';
import '../model/expense.dart';
import '../widgets/expenses_list/expenses_list.dart';
import '../widgets/new_expense.dart';
import '../widgets/chart/chart.dart';

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

  void _removeExpense(Expense expense) {
    setState(() {
      _expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (_) => NewExpence(
                  onAddExpense: _addExpense,
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 500
          ? Column(
              children: [
                Expanded(
                  child: Chart(expenses: _expenses),
                ),
                Expanded(
                  flex: 2 ,
                  child: ExpensesList(
                    expenses: _expenses,
                    onRemoveExpense: _removeExpense,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _expenses),
                ),
                Expanded(
                  child: ExpensesList(
                    expenses: _expenses,
                    onRemoveExpense: _removeExpense,
                  ),
                ),
              ],
            ),
    );
  }
}
