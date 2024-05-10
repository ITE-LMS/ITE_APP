// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/models/Themes.dart';
import 'package:public_testing_app/main.dart';

class snackBar {
  final Widget? title;
  final Widget? message;
  final Widget? image;
  final String? messageLabel;
  final String? titleLabel;
  final String? path;

  snackBar({
    @required this.path,
    @required this.title,
    @required this.message,
    @required this.image,
    @required this.messageLabel,
    @required this.titleLabel,
  });

  void snackbar() => Get.snackbar(
        '',
        '',
        margin: const EdgeInsets.all(5),
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.onPrimary
            : Themes.colorScheme.primary,
        duration: const Duration(seconds: 3),
        titleText: title ??
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                titleLabel ?? '',
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
        messageText: message ??
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                messageLabel ?? '',
                style: TextStyle(
                  fontSize: Get.mediaQuery.size.width / 20,
                  color: Colors.white,
                ),
              ),
            ),
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: image ??
              Image.asset(
                path!,
                width: Get.mediaQuery.size.width / 5,
                height: Get.mediaQuery.size.width / 5,
              ),
        ),
      );
}
