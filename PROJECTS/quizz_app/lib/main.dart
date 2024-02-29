import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/inital_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: InitialScreen(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
