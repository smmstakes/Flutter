import "package:flutter/material.dart";
import "package:app_test/widgets/wello_horld_text.dart";

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 18, 71),
            Color.fromARGB(255, 128, 138, 224)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.mirror,
        ),
      ),
      child: const Center(
        child: WelloHorld(),
      ),
    );
  }
}
