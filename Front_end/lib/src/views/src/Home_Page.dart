// ignore_for_file: file_names, avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Home_Controllers/Home_Controller.dart';

import 'package:public_testing_app/src/controllers/Home_Page_Controllers/Bottom_Navigation_Controller.dart';
import 'package:public_testing_app/src/controllers/Home_Page_Controllers/Drawer_Controller.dart';
import 'package:public_testing_app/src/views/src/homepage_elements/Drawer.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';

import 'homepage_elements/Animated_darkMode_button.dart';
import 'homepage_elements/drawer_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DrawersController controller = Get.put(DrawersController());

    List<Widget> student = [];

    if (Auth!.getString('user') == 'active_student') {
      student = [
        // HOME :
        NavigationDestination(
          selectedIcon: Themes.isDarkMode()
              ? Image(
                  image: const AssetImage('assets/images/home.png'),
                  width: Themes.getWidth(context) / 15,
                  height: Themes.getWidth(context) / 15,
                  color: Themes.getColor(Colors.green, Colors.blue),
                )
              : Container(
                  width: MediaQuery.of(context).size.width / 7,
                  height: MediaQuery.of(context).size.width / 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    image: const AssetImage('assets/images/home.png'),
                    width: Themes.getWidth(context) / 15,
                    height: Themes.getWidth(context) / 15,
                    color: Themes.getColor(Colors.green, Colors.blue),
                  ),
                ),
          icon: Image(
            image: const AssetImage('assets/images/home.png'),
            width: Themes.getWidth(context) / 15,
            height: Themes.getWidth(context) / 15,
            color: Themes.getColor(Colors.white, Colors.black),
          ),
          label: 'Home',
        ),
        // COURSES :
        NavigationDestination(
          selectedIcon: is_Dark!.getString('is_dark') == 'true'
              ? Image(
                  image: const AssetImage('assets/images/seminar.png'),
                  width: Themes.getWidth(context) / 15,
                  height: Themes.getWidth(context) / 15,
                  color: is_Dark!.getString('is_dark') == 'true'
                      ? Colors.green
                      : Colors.blue,
                )
              : Container(
                  width: MediaQuery.of(context).size.width / 7,
                  height: MediaQuery.of(context).size.width / 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    image: const AssetImage('assets/images/seminar.png'),
                    width: Themes.getWidth(context) / 15,
                    height: Themes.getWidth(context) / 15,
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Colors.green
                        : Colors.blue,
                  ),
                ),
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
      ];
    }

    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.background.withOpacity(.9)
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
            'BeITE',
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
                final controllerHome = HomeController();
                if (appData!.getBool('isSeeAll') == true && index == 0) {
                  appData!.setBool('isSeeAll', false);
                  controllerHome.update(['seeAll']);
                }
                nav_controller.selectedIndex = index;
                nav_controller.update();
              },
              backgroundColor: is_Dark!.getString('is_dark') == 'true'
                  ? Themes.darkColorScheme.background
                  : Themes.colorScheme.primaryContainer,
              destinations: [
                ...student,
                // MY Subjects :
                NavigationDestination(
                  selectedIcon: is_Dark!.getString('is_dark') == 'true'
                      ? Image(
                          image: const AssetImage('assets/images/library.png'),
                          width: Themes.getWidth(context) / 15,
                          height: Themes.getWidth(context) / 15,
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Colors.green
                              : Colors.blue,
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.width / 14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image(
                            image:
                                const AssetImage('assets/images/library.png'),
                            width: Themes.getWidth(context) / 15,
                            height: Themes.getWidth(context) / 15,
                            color: is_Dark!.getString('is_dark') == 'true'
                                ? Colors.green
                                : Colors.blue,
                          ),
                        ),
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
                // QUIZES :
                NavigationDestination(
                  selectedIcon: is_Dark!.getString('is_dark') == 'true'
                      ? Image(
                          image: const AssetImage('assets/images/quiz.png'),
                          width: Themes.getWidth(context) / 15,
                          height: Themes.getWidth(context) / 15,
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Colors.green
                              : Colors.blue,
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.width / 14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image(
                            image: const AssetImage('assets/images/quiz.png'),
                            width: Themes.getWidth(context) / 15,
                            height: Themes.getWidth(context) / 15,
                            color: is_Dark!.getString('is_dark') == 'true'
                                ? Colors.green
                                : Colors.blue,
                          ),
                        ),
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
                // GIMINI AI :
                NavigationDestination(
                  selectedIcon: is_Dark!.getString('is_dark') == 'true'
                      ? Image(
                          image: const AssetImage('assets/images/chatbot.png'),
                          width: Themes.getWidth(context) / 15,
                          height: Themes.getWidth(context) / 15,
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Colors.green
                              : Colors.blue,
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.width / 14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image(
                            image:
                                const AssetImage('assets/images/chatbot.png'),
                            width: Themes.getWidth(context) / 15,
                            height: Themes.getWidth(context) / 15,
                            color: is_Dark!.getString('is_dark') == 'true'
                                ? Colors.green
                                : Colors.blue,
                          ),
                        ),
                  icon: Image(
                    image: const AssetImage('assets/images/chatbot.png'),
                    width: Themes.getWidth(context) / 15,
                    height: Themes.getWidth(context) / 15,
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Colors.white
                        : Colors.black,
                  ),
                  label: 'AI',
                ),
              ],
            );
          },
        ),
        body: GetBuilder<BottomNavigationController>(
          init: BottomNavigationController(),
          builder: (controller) {
            if (Auth!.getString('user') == 'active_student') {
              return controller.StudentSCreens[controller.selectedIndex];
            }
            return controller.OtherUsersScreens[controller.selectedIndex];
          },
        ),
      ),
    );
  }
}
