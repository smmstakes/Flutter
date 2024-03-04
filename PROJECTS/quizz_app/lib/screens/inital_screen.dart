import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:quizz_app/screens/questions_screen.dart';
// import 'package:quizz_app/screens/questions_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen(this.startQuiz, {super.key}); // Constructor Function

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "/images/quiz-logo.png",
            height: 170,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.add_task_sharp),
            label: const Text(
              "Start Quiz",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
