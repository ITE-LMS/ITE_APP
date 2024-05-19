// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/widgets/ListTile.dart';
import 'package:public_testing_app/src/controllers/Home_Page_Controllers/Drawer_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/controllers/Auth_Controllers/change_pass_controller.dart';
import 'package:public_testing_app/src/controllers/Auth_Controllers/logout_Controller.dart';
import 'package:public_testing_app/main.dart';

final class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final logout_controller = Get.put(LogoutController());
    final changePass_controller = Get.put(ChangePassController());
    final drawer_controller = Get.put(DrawersController());

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CircleAvatar(
                    backgroundColor: is_Dark!.getString('is_dark') == 'true'
                        ? Colors.white
                        : Colors.black,
                    radius: Themes.getWidth(context) / 9,
                    child: GetBuilder<DrawersController>(
                      id: 'image',
                      init: DrawersController(),
                      builder: (dr_controller) {
                        return appData!.getString('image') != null
                            ? CircleAvatar(
                                radius: Themes.getWidth(context) / 9.5,
                                backgroundImage: FileImage(
                                  File(appData!.getString('image')!),
                                ),
                              )
                            : dr_controller.image != null
                                ? CircleAvatar(
                                    radius: Themes.getWidth(context) / 9.5,
                                    backgroundImage:
                                        FileImage(dr_controller.image!),
                                  )
                                : CircleAvatar(
                                    radius: Themes.getWidth(context) / 9.5,
                                    backgroundImage: const AssetImage(
                                        'assets/images/student.png'),
                                  );
                      },
                    ),
                  ),
                ),
                Text(
                  Auth!.getString('user_name')!,
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
            onTap: () {
              Get.toNamed('OldPassPageScreen');
            },
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
              image: const AssetImage('assets/images/translation.png'),
            ),
          ),
          MyListTile(
            label: 'Change Photo',
            onTap: () {
              drawer_controller.PickImageFromGallery(context);
            },
            prefix: Image(
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.white
                  : Colors.black,
              height: Themes.getWidth(context) / 12,
              width: Themes.getWidth(context) / 10,
              image: const AssetImage('assets/images/gallery.png'),
            ),
          ),
          MyListTile(
            label: 'Log Out',
            onTap: () {
              logout_controller.onLogOut();
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
