import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizz_app/widgets/answers_button.dart';
import 'package:quizz_app/data/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion() {
    setState(
      () {
        currentQuestionIndex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsList[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswersButton(
                  answer: answer,
                  onTap: answerQuestion,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
