import 'package:flutter/material.dart';
import 'package:roll_dice_app/widgets/dice_roller.dart';

const topLeft = Alignment.topLeft;
const bottomRight = Alignment.bottomRight;

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
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
