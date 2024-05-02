// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:public_testing_app/Project%201/components/ListTile.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';

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
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width / 40),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: is_Dark!.getString('is_dark') == 'true'
                      ? Colors.white
                      : Colors.black,
                  radius: MediaQuery.of(context).size.width / 9,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 9.5,
                    backgroundImage: const AssetImage(
                      //photo!getString('url') ??
                      'assets/images/student.png',
                    ),
                  ),
                ),
                Text(
                  Auth!.getString('user_name') ?? '',
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
            prefix: Image(
              height: MediaQuery.of(context).size.width / 12,
              width: MediaQuery.of(context).size.width / 10,
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
              height: MediaQuery.of(context).size.width / 12,
              width: MediaQuery.of(context).size.width / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/library.png'),
            ),
          ),
          MyListTile(
            label: 'Courses',
            onTap: () {},
            prefix: Image(
              height: MediaQuery.of(context).size.width / 12,
              width: MediaQuery.of(context).size.width / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/seminar.png'),
            ),
          ),
          MyListTile(
            label: 'Saved Files',
            onTap: () {},
            prefix: Image(
              height: MediaQuery.of(context).size.width / 12,
              width: MediaQuery.of(context).size.width / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/bookmark.png'),
            ),
          ),
          MyListTile(
            label: 'Edit Profile',
            onTap: () async {
              // await GoogleSignIn().signOut();
              // Auth!.setString('logedIn', 'false');
              // Get.offAllNamed('EmailPageScreen');
            },
            prefix: Image(
                color: is_Dark!.getString('is_dark') == 'true'
                    ? Colors.white
                    : Colors.black,
                height: MediaQuery.of(context).size.width / 12,
                width: MediaQuery.of(context).size.width / 10,
                image: const AssetImage('assets/images/edit.png')),
          ),
          MyListTile(
            label: 'Settings',
            onTap: () {},
            prefix: Image(
              height: MediaQuery.of(context).size.width / 12,
              width: MediaQuery.of(context).size.width / 10,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              image: const AssetImage('assets/images/settings.png'),
            ),
          ),
        ],
      ),
    );
  }
}
