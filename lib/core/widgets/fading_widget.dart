import 'package:flutter/material.dart';

class FadingWidget extends StatefulWidget {
  const FadingWidget({super.key, required this.child});
  final Widget child;

  @override
  State<FadingWidget> createState() => _FadingWidgetState();
}

class _FadingWidgetState extends State<FadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: .2, end: .8).animate(animationController);

    animationController.addListener(
      () {
        if (mounted) {
          setState(() {});
        }
      },
    );
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.removeListener(() {}); // Remove listener
    animationController.stop(); // Stop the animation
    animationController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: animation.value, child: widget.child);
  }
}
