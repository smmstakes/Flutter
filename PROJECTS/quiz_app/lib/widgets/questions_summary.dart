import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.sumarryData});

  final List<Map<String, Object>> sumarryData;

  @override
  Widget build(BuildContext context) {
    Color? correctColors(Map<String, Object> data) {
      return data["user_answer"] == data["correct_answer"]
          ? const Color.fromARGB(255, 3, 179, 38)
          : const Color.fromARGB(255, 255, 38, 0);
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: sumarryData.map(
            (data) {
              final Color? correctColor = correctColors(data);
              return Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: correctColor,
                      child: Text(
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        ((data['questions_id'] as int) + 1).toString(),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            data["question"] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            style: GoogleFonts.lato(
                              color: correctColor,
                              fontSize: 16,
                            ),
                            data["user_answer"] as String),
                        Text(
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 3, 179, 38),
                              fontSize: 16,
                            ),
                            data["correct_answer"] as String),
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
