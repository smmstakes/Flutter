import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var formatted = DateFormat("dd/MM/yyyy");

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.dining,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.menu_book_sharp,
  Category.work: Icons.work_rounded
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  })  : id = uuid.v4(),
        icon = categoryIcons[category];

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final IconData? icon;

  String get formattedDate {
    return formatted.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((item) => item.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
