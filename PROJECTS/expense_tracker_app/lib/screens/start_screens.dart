import 'package:expense_tracker_app/widgets/form/expenses_form.dart';
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

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => ExpenseForms(addExpense: _addExpense));
  }

  void _removeExpense(Expense expense) {
    final expenseId = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense deleted."),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseId, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpense,
            icon: const Icon(Icons.add_circle_outline_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
