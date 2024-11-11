import 'package:flutter/material.dart';

class FadingText extends StatelessWidget {
  const FadingText({
    super.key,
    required this.fadeAnimate,
  });

  final Animation<double> fadeAnimate;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimate,
      builder: (context, _) => FadeTransition(
        opacity: fadeAnimate,
        child: const Text(
          "For Reading a free books",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
