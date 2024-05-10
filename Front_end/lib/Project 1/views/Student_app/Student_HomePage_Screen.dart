// ignore_for_file: file_names, avoid_print, unused_local_variable, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/controllers/Home_Page_Controllers/Drawer_Controller.dart';
import 'package:public_testing_app/Project%201/views/Student_app/Elements_For_Student_App/Drawer.dart';
import 'package:public_testing_app/Project 1/models/Themes.dart';
import 'package:public_testing_app/main.dart';

import 'Elements_For_Student_App/Animated_darkMode_button.dart';
import 'Elements_For_Student_App/drawer_icon.dart';

DrawersController controller = Get.put(DrawersController());

class StudentHomePageScreen extends StatelessWidget {
  const StudentHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(Auth!.getString('user')!);
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.background
            : Colors.white,
        appBar: AppBar(
          backgroundColor: is_Dark!.getString('is_dark') == 'true'
              ? Themes.darkColorScheme.background
              : Themes.colorScheme.primaryContainer,
          elevation: 3,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 6.0),
              child: AnimatedDarkModeButton(),
            ),
          ],
          leading: const drawerIcon(),
          centerTitle: true,
          title: Text(
            'ITE',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.primary
                      : Themes.colorScheme.primary,
                  fontSize: Themes.getWidth(context) / 12,
                ),
          ),
        ),
      ),
    );
  }
}
