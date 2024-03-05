import 'package:flutter/material.dart';

import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Apple",
        amount: 3.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Pen",
        amount: 0.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Bus Ticket",
        amount: 15.99,
        date: DateTime.now(),
        category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
