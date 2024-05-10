// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/controllers/dark_mode_Controller.dart';
import 'package:public_testing_app/main.dart';

import 'package:public_testing_app/Project 1/models/Themes.dart';

DarkModeController controller = Get.put(DarkModeController());

class InsiderContainer extends StatelessWidget {
  const InsiderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DarkModeController>(
        init: DarkModeController(),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: is_Dark!.getString('is_dark') == 'true'
                    ? [
                        Themes.darkColorScheme.primary.withOpacity(.7),
                        Themes.darkColorScheme.primary,
                      ]
                    : [
                        Themes.colorScheme.primary,
                        Themes.colorScheme.primary.withOpacity(0.5),
                      ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          );
        });
  }
}
