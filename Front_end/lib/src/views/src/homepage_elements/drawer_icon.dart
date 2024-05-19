// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/dark_mode_Controller.dart';
import 'package:public_testing_app/main.dart';

import 'package:public_testing_app/src/models/Themes.dart';

class drawerIcon extends StatelessWidget {
  const drawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DarkModeController>(
      init: DarkModeController(),
      builder: (controller) => Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Image(
              height: Themes.getWidth(context) / 12,
              width: Themes.getWidth(context) / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Themes.darkColorScheme.primary
                  : Themes.colorScheme.primary,
              image: const AssetImage('assets/images/option.png'),
            ),
          );
        },
      ),
    );
  }
}
