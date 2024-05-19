// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/dark_mode_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.onTap,
      required this.leading,
      required this.title});

  final void Function() onTap;
  final String leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DarkModeController>(
      init: DarkModeController(),
      builder: (darkController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2.0,
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                  spreadRadius: 1.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              border: Border.all(
                color: is_Dark!.getString('is_dark') == 'true'
                    ? Themes.darkColorScheme.primary
                    : Themes.colorScheme.primary,
                width: 2.5,
              ),
              borderRadius: BorderRadius.circular(8),
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Themes.darkColorScheme.onPrimary
                  : Themes.colorScheme.primaryContainer,
            ),
            width: Themes.getWidth(context),
            height: Themes.getHeight(context) / 14,
            child: ListTile(
              onTap: onTap,
              leading: Text(
                leading,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                Iconsax.arrow_right,
                size: MediaQuery.of(context).size.width * 0.08,
                color: is_Dark!.getString('is_dark') == 'true'
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
