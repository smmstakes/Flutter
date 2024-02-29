import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/quiz_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void startQuiz() {
    const QuizScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 7, 34, 189),
            Color.fromARGB(255, 125, 140, 224)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/quiz-logo.png",
              height: 170,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            TextButton(
              onPressed: startQuiz,
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
