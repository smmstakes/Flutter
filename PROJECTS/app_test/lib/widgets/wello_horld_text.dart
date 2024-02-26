import 'package:flutter/material.dart';

class WelloHorld extends StatelessWidget {
  const WelloHorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Wello Horld!",
      style: TextStyle(
        color: Colors.amberAccent,
        fontSize: 17,
        wordSpacing: 5,
      ),
    );
  }
}
