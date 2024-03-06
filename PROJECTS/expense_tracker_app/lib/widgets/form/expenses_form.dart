import 'package:flutter/material.dart';

class ExpenseForms extends StatefulWidget {
  const ExpenseForms({super.key});

  @override
  State<ExpenseForms> createState() => _ExpenseFormsState();
}

class _ExpenseFormsState extends State<ExpenseForms> {
  final _tittleController = TextEditingController();
  final _amountController = TextEditingController();

  void _datePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 5, now.month, now.day);
    final lastDate = DateTime(now.year + 5, now.month, now.day);

    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
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
                    prefixText: "\$",
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
                    const Text("Selected Date"),
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
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel_sharp),
                label: const Text("Cancel"),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // print("${_amountController.text} ${_tittleController.text}");
                },
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
