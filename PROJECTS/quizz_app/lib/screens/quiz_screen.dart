import 'package:flutter/material.dart';
import 'package:quizz_app/data/quiz_questions.dart';
import 'package:quizz_app/screens/questions_screen.dart';
import 'package:quizz_app/screens/inital_screen.dart';
import 'package:quizz_app/screens/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = InitialScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(
      () {
        activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
      },
    );
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = InitialScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questionsList.length) {
      setState(() {
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
      });
    }
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
