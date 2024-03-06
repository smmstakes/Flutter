import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:expense_tracker_app/models/expense.dart';

var formatted = DateFormat("dd/MM/yyyy");

class ExpenseForms extends StatefulWidget {
  const ExpenseForms({super.key, required this.addExpense});

  final Function addExpense;

  @override
  State<ExpenseForms> createState() => _ExpenseFormsState();
}

class _ExpenseFormsState extends State<ExpenseForms> {
  final _tittleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;
  DateTime? _selectedDate;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 5, now.month, now.day);
    final lastDate = DateTime(now.year + 5, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final tittleIsInvalid = _tittleController.text.trim().isEmpty;
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    final dateIsInvalid = _selectedDate == null;

    if (tittleIsInvalid || amountIsInvalid || dateIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text(
              "Please make sure a valid tittle, amount, date and category was entered."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
      return;
    }

    widget.addExpense(
      Expense(
          title: _tittleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _tittleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _tittleController,
            maxLength: 64,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text(
                "Title",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            showCursor: true,
            cursorColor: Colors.black,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text(
                      "Amount",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  showCursor: true,
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? "No selected date"
                        : formatted.format(_selectedDate!)),
                    IconButton(
                      onPressed: _datePicker,
                      icon: const Icon(Icons.calendar_month_sharp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel_sharp),
                label: const Text("Cancel"),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: _submitExpenseData,
                icon: const Icon(Icons.check_circle_sharp),
                label: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
