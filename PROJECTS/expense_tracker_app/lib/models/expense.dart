import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

var formatted = DateFormat("dd/MM/yyyy HH:mm");

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
