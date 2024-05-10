// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';

import 'package:public_testing_app/Project 1/models/Themes.dart';

class DarkModeController extends GetxController {
  bool is_dark_mode = is_Dark!.getString('is_dark') == 'true';

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
        systemNavigationBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
      ),
    );
    super.onInit();
  }

  void changeMode(bool dark) {
    if (dark == true) {
      Get.changeThemeMode(ThemeMode.dark);
      is_Dark!.setString('is_dark', 'true');
    } else {
      Get.changeThemeMode(ThemeMode.light);
      is_Dark!.setString('is_dark', 'false');
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
        systemNavigationBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
      ),
    );
    update();
  }
}
