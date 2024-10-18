import '../enum/category.dart';
import 'expense.dart';

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket(this.category, this.expenses);
  ExpenseBucket.category(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where(
              (element) => element.category == category,
            )
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
