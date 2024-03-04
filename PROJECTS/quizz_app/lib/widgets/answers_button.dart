import 'package:flutter/material.dart';

class AnswersButton extends StatelessWidget {
  const AnswersButton({
    super.key,
    required this.answer,
    required this.onTap,
  });

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
        ),
        child: Text(
          answer,
          style: const TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
