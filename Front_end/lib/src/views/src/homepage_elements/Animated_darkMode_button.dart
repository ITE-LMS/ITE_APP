// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/dark_mode_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';

class AnimatedDarkModeButton extends StatelessWidget {
  const AnimatedDarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DarkModeController>(
        init: DarkModeController(),
        builder: (dark_controller) {
          return GestureDetector(
            onTap: () {
              dark_controller.is_dark_mode = !dark_controller.is_dark_mode;
              dark_controller.changeMode(dark_controller.is_dark_mode);
              dark_controller.update();
            },
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns:
                        Tween<double>(begin: 0.3, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: Image(
                  key: ValueKey(is_Dark!.getString('is_dark')),
                  color: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.primary
                      : Themes.colorScheme.primary,
                  height: Themes.getWidth(context) / 12,
                  width: Themes.getWidth(context) / 10,
                  image: is_Dark!.getString('is_dark') == 'true'
                      ? const AssetImage('assets/images/moon.png')
                      : const AssetImage('assets/images/sun.png'),
                )),
          );
        });
  }
}
