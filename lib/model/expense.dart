import 'package:uuid/uuid.dart';

enum Category {
  food,
  travel,
  leisure,
  work,
}

const Uuid uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
