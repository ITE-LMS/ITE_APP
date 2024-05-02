// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController sizeAnimationController;
  late AnimationController colorAnimationController;
  late Animation changeColor;
  bool isActive = false;

  @override
  void initState() {
    sizeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 200),
      value: 1.0,
      upperBound: 1.2,
      lowerBound: 1.0,
    );
    colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 200),
    );
    changeColor = ColorTween(begin: Colors.black, end: Colors.blue)
        .animate(colorAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    sizeAnimationController.dispose();
    colorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: sizeAnimationController,
        child: AnimatedBuilder(
          animation: colorAnimationController,
          builder: (ctx, child) => IconButton(
            onPressed: () {
              isActive
                  ? sizeAnimationController.forward()
                  : sizeAnimationController.reverse();
              isActive = !isActive;
            },
            icon: Image(
              image: const AssetImage('assets/images/night.png'),
              color: changeColor.value,
            ),
          ),
        ));
  }
}
