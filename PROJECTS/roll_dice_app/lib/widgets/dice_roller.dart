import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  //Add '_' and "State" do garantee the organization

  int? diceRoll = 1;

  void rollDice() {
    setState(() {
      diceRoll = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "images/dice-$diceRoll.png",
          width: 150,
          height: 150,
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 240, 242, 245),
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
          child: const Text(
            "Roll the Dice!",
          ),
        )
      ],
    );
  }
}
