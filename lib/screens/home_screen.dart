import 'package:flutter/material.dart';

import '../model/expense.dart';
import '../widgets/expenses_list/expenses_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> expenses = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpensesList(expenses: expenses),
    );
  }
}
