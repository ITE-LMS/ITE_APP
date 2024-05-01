// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:public_testing_app/Project%201/components/ListTile.dart';
import 'package:public_testing_app/Project%201/controllers/dark_mode_Controller.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Get.isDarkMode
          ? Themes.darkColorScheme.secondaryContainer
          : Themes.colorScheme.primaryContainer,
      child: Column(
        children: [
          DrawerHeader(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width / 40),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
                  radius: MediaQuery.of(context).size.width / 9,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 9.5,
                    backgroundImage: const AssetImage(
                      'assets/images/nour.JPG',
                    ),
                  ),
                ),
                Text(
                  Auth!.getString('user_name')!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: MediaQuery.of(context).size.width / 20,
                      ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  Auth!.getString('email')!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: MediaQuery.of(context).size.width / 35,
                      ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          MyListTile(
            label: 'Home',
            onTap: () {},
            prefix: const Icon(Icons.home),
          ),
          MyListTile(
            label: 'Profile',
            onTap: () {},
            prefix: const Icon(Icons.person_rounded),
          ),
          GetBuilder<DarkModeController>(
              init: DarkModeController(),
              builder: (controller) {
                return SwitchListTile(
                  title: Row(
                    children: [
                      const Icon(Icons.nightlight_outlined),
                      const SizedBox(width: 15),
                      Text(
                        'Night Mode',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: MediaQuery.of(context).size.width / 23),
                      ),
                    ],
                  ),
                  value: controller.is_dark_mode,
                  onChanged: (value) {
                    controller.is_dark_mode = !controller.is_dark_mode;
                    controller.changeMode(controller.is_dark_mode);
                    controller.update();
                  },
                );
              }),
          MyListTile(
            label: 'logOut',
            onTap: () async {
              await GoogleSignIn().signOut();
              Auth!.setString('logedIn', 'flase');
              Get.offAllNamed('EmailPageScreen');
            },
            prefix: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
