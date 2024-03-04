import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.sumarryData});

  final List<Map<String, Object>> sumarryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:300,
      child: SingleChildScrollView(
        child: Column(
          children: sumarryData.map(
            (data) {
              return Row(
                children: [
                  Text(((data['questions_id'] as int) + 1).toString(),),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data["question"] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data["user_answer"] as String),
                        Text(data["correct_answer"] as String),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
