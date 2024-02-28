import 'package:flutter/material.dart';
import 'package:roll_dice_app/widgets/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(255, 224, 79, 22),
          Color.fromARGB(255, 194, 128, 185)
        ]),
      ),
      debugShowCheckedModeBanner: false,
    ),
  ); // Create a widget on the screen
}
