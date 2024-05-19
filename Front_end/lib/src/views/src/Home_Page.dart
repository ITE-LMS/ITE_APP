// ignore_for_file: file_names, avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:public_testing_app/src/controllers/Home_Page_Controllers/Bottom_Navigation_Controller.dart';
import 'package:public_testing_app/src/controllers/Home_Page_Controllers/Drawer_Controller.dart';
import 'package:public_testing_app/src/views/src/homepage_elements/Drawer.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';

import 'homepage_elements/Animated_darkMode_button.dart';
import 'homepage_elements/drawer_icon.dart';

DrawersController controller = Get.put(DrawersController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          bottomNavigationBar: GetBuilder<BottomNavigationController>(
            init: BottomNavigationController(),
            builder: (nav_controller) {
              return NavigationBar(
                height: Themes.getWidth(context) / 5.5,
                elevation: 2,
                selectedIndex: nav_controller.selectedIndex,
                onDestinationSelected: (index) {
                  nav_controller.selectedIndex = index;
                  nav_controller.update();
                },
                backgroundColor: is_Dark!.getString('is_dark') == 'true'
                    ? Themes.darkColorScheme.background
                    : Themes.colorScheme.primaryContainer,
                destinations: [
                  NavigationDestination(
                    icon: Image(
                      image: const AssetImage('assets/images/home.png'),
                      width: Themes.getWidth(context) / 15,
                      height: Themes.getWidth(context) / 15,
                      color: is_Dark!.getString('is_dark') == 'true'
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Image(
                      image: const AssetImage('assets/images/library.png'),
                      width: Themes.getWidth(context) / 15,
                      height: Themes.getWidth(context) / 15,
                      color: is_Dark!.getString('is_dark') == 'true'
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: 'MySubjects',
                  ),
                  NavigationDestination(
                    icon: Image(
                      image: const AssetImage('assets/images/seminar.png'),
                      width: Themes.getWidth(context) / 15,
                      height: Themes.getWidth(context) / 15,
                      color: is_Dark!.getString('is_dark') == 'true'
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: 'Courses',
                  ),
                  NavigationDestination(
                    icon: Image(
                      image: const AssetImage('assets/images/quiz.png'),
                      width: Themes.getWidth(context) / 15,
                      height: Themes.getWidth(context) / 15,
                      color: is_Dark!.getString('is_dark') == 'true'
                          ? Colors.white
                          : Colors.black,
                    ),
                    label: 'Quizes',
                  ),
                ],
              );
            },
          ),
          body: GetBuilder<BottomNavigationController>(
            init: BottomNavigationController(),
            builder: (controller) {
              return controller.screens[controller.selectedIndex];
            },
          )),
    );
  }
}
