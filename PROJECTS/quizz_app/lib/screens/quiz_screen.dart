import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/inital_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
          child: const InitialScreen(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
