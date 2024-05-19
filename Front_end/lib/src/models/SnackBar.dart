// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';

class snackBar {
  final Widget? title;
  final Widget? message;
  final String? path;
  final Color? BorderColor;

  snackBar({
    @required this.BorderColor,
    @required this.path,
    @required this.title,
    @required this.message,
  });

  void snackbar() => Get.snackbar(
        '',
        '',
        shouldIconPulse: true,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        maxWidth: Get.mediaQuery.size.width - 50,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(vertical: 25),
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.onPrimary
            : Themes.colorScheme.primary,
        duration: const Duration(seconds: 4),
        titleText: title,
        messageText: message,
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            path!,
            width: Get.mediaQuery.size.width / 5,
            height: Get.mediaQuery.size.width / 5,
          ),
        ),
        borderColor: BorderColor,
        borderWidth: 2,
        borderRadius: 12,
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [const BoxShadow(spreadRadius: 1, blurRadius: 5)],
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.decelerate,
      );
}
