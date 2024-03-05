import 'package:flutter/material.dart';

import 'package:expense_tracker_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // this widget is used when you have a list and don't want to display everything
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, id) => Text(expenses[id].title),
    );
  }
}
