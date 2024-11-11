import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/core/utils/assets_data.dart';
import 'package:project/core/utils/routing.dart';

import 'fading_text.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({
    super.key,
  });

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> fadeAnimate;
  @override
  void initState() {
    super.initState();
    initAnimator();
    navigateToHomeView();
  }

  void navigateToHomeView() async {
    await Future.delayed(const Duration(seconds: 2));

    // ignore: use_build_context_synchronously
    GoRouter.of(context).push(AppRouter.kHomeView);
  }

  void initAnimator() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    fadeAnimate =
        Tween<double>(begin: 0.1, end: 1.0).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        FadingText(fadeAnimate: fadeAnimate)
      ],
    );
  }
}
