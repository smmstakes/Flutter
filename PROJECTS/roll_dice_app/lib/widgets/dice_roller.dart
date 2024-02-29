import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> with TickerProviderStateMixin {
  // Add '_' and "State" for organization

  int hatTrickCount = 0;
  int? previousDice = 1, diceRoll = 1;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  void hatTrickAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Congratulations, you got a Hat-Trick!!!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Use arrow syntax
            child: const Text("Thanks!"),
          ),
        ],
      ),
    );
  }

  void rollDice() {
    diceRoll = Random().nextInt(6) + 1;

    if (diceRoll == previousDice) {
      hatTrickCount++;
      if (hatTrickCount == 2) {
        hatTrickAlert();
        hatTrickCount = 0;
      }
    } else {
      hatTrickCount = 0;
    }

    previousDice = diceRoll;

    _controller.reset();
    _controller.forward();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
          turns: _animation,
          child: Image.asset(
            "images/dice-$diceRoll.png",
            width: 150,
            height: 150,
          ),
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
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
