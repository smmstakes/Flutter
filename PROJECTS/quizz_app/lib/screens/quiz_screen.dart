import 'package:flutter/material.dart';
import 'package:quizz_app/screens/questions_screen.dart';
import 'package:quizz_app/screens/inital_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = InitialScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

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
          child: activeScreen,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
