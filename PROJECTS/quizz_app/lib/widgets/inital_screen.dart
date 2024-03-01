import 'package:flutter/material.dart';
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
            "images/quiz-logo.png",
            height: 200,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
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
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
