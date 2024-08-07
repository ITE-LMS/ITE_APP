// ignore_for_file: file_names, non_constant_identifier_names

//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project 1/models/Themes.dart';

class DrawersController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Get.isDarkMode
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
        systemNavigationBarColor: Get.isDarkMode
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
      ),
    );
    super.onInit();
  }
}
