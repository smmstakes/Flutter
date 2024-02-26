import 'package:flutter/material.dart';
import 'package:app_test/widgets/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  ); // Create a widget on the screen
}
