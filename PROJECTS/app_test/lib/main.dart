import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: ),
          ),
          child: const Center(
            child: Text("Wello Horld!"),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  ); // Create a widget on the screen
}
