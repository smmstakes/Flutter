import 'package:flutter/material.dart';

const topLeft = Alignment.topLeft;
const bottomRight = Alignment.bottomRight;
var activeDice = "images/dice-1.png";

void rollDice() {
  activeDice = "images/dice-2.png";
}

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: topLeft,
          end: bottomRight,
          tileMode: TileMode.mirror,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDice,
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
        ),
      ),
    );
  }
}
