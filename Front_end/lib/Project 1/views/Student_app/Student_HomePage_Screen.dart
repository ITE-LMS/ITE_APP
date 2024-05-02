// ignore_for_file: file_names, avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/controllers/Home_Page_Controllers/Drawer_Controller.dart';
import 'package:public_testing_app/Project%201/views/Student_app/Elements_For_Student_App/Drawer.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';

DrawersController controller = Get.put(DrawersController());

class StudentHomePageScreen extends StatelessWidget {
  const StudentHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.background
            : Colors.white,
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Image(
                    height: MediaQuery.of(context).size.width / 12,
                    width: MediaQuery.of(context).size.width / 10,
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Colors.green
                        : Colors.blue,
                    image: const AssetImage('assets/images/option.png')));
          }),
          centerTitle: true,
          title: Text(
            'ITE',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: is_Dark!.getString('is_dark') == 'true'
                      ? Colors.green
                      : Colors.blue,
                ),
          ),
        ),
      ),
    );
  }
}
