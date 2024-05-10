// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/components/ListTile.dart';
import 'package:public_testing_app/Project 1/models/Themes.dart';
import 'package:public_testing_app/Project%201/controllers/Auth_Controllers/logout_Controller.dart';
import 'package:public_testing_app/main.dart';

LogoutController controller = Get.put(LogoutController());

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: is_Dark!.getString('is_dark') == 'true'
          ? Themes.darkColorScheme.secondaryContainer
          : Themes.colorScheme.primaryContainer,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(top: Themes.getWidth(context) / 40),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: is_Dark!.getString('is_dark') == 'true'
                      ? Colors.white
                      : Colors.black,
                  radius: Themes.getWidth(context) / 9,
                  child: CircleAvatar(
                    radius: Themes.getWidth(context) / 9.5,
                    backgroundImage: const AssetImage(
                      //photo!getString('url') ??
                      'assets/images/student.png',
                    ),
                  ),
                ),
                Text(
                  Auth!.getString('user_name') ?? '',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: Themes.getWidth(context) / 20,
                      ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  Auth!.getString('email')!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: Themes.getWidth(context) / 35,
                      ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          MyListTile(
            label: 'Home',
            onTap: () {},
            prefix: Image(
              height: Themes.getWidth(context) / 12,
              width: Themes.getWidth(context) / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/home.png'),
            ),
          ),
          MyListTile(
            label: 'My Subject',
            onTap: () {},
            prefix: Image(
              height: Themes.getWidth(context) / 12,
              width: Themes.getWidth(context) / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/library.png'),
            ),
          ),
          MyListTile(
            label: 'Saved Files',
            onTap: () {},
            prefix: Image(
              height: Themes.getWidth(context) / 12,
              width: Themes.getWidth(context) / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/bookmark.png'),
            ),
          ),
          MyListTile(
            label: 'Change Password',
            onTap: () {},
            prefix: Image(
              height: Themes.getWidth(context) / 12,
              width: Themes.getWidth(context) / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/reset-password.png'),
            ),
          ),
          MyListTile(
            label: 'Change Language',
            onTap: () {},
            prefix: Image(
                color: is_Dark!.getString('is_dark') == 'true'
                    ? Colors.white
                    : Colors.black,
                height: Themes.getWidth(context) / 12,
                width: Themes.getWidth(context) / 10,
                image: const AssetImage('assets/images/translation.png')),
          ),
          MyListTile(
            label: 'Log Out',
            onTap: () {
              controller.onLogOut();
            },
            prefix: Image(
              height: Themes.getWidth(context) / 12,
              width: Themes.getWidth(context) / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/logout.png'),
            ),
          ),
        ],
      ),
    );
  }
}
