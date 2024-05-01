// ignore_for_file: file_names, avoid_print, unused_local_variable, non_constant_identifier_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/controllers/Home_Page_Controllers/Drawer_Controller.dart';
import 'package:public_testing_app/Project%201/views/Doctor_app/Doctor_HomePage_Screen.dart';
import 'package:public_testing_app/Project%201/views/Doctor_app/Elements_For_Doctor_App/Container.dart';
import 'package:public_testing_app/Project%201/views/Doctor_app/Elements_For_Doctor_App/Drawer.dart';
import 'package:public_testing_app/Themes.dart';

DrawersController controller = Get.put(DrawersController());

class DoctorDrawerScreen extends StatelessWidget {
  const DoctorDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Get.isDarkMode ? Themes.darkColorScheme.background : Colors.white,
        body: Stack(
          children: [
            const InsiderContainer(),
            // navigation menu :
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                padding: const EdgeInsets.all(8.0),
                child: const MyDrawer(),
              ),
            ),
            GetBuilder<DrawersController>(
              id: 'animation',
              init: DrawersController(),
              builder: (controller) {
                return TweenAnimationBuilder(
                  tween:
                      Tween<double>(begin: 0, end: controller.Drawer_Activater),
                  duration: const Duration(milliseconds: 500),
                  builder: (_, double val, __) {
                    return (Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(
                            0, 3, MediaQuery.of(context).size.width / 1.3 * val)
                        ..rotateY((pi / 6) * val),
                      child: const DoctorHomePageScreen(),
                    ));
                  },
                );
              },
            ),
            GestureDetector(
              onHorizontalDragUpdate: (e) {
                if (e.delta.dx > 0) {
                  controller.Drawer_Activater = 1;
                } else {
                  controller.Drawer_Activater = 0;
                }
                controller.update(['animation']);
              },
            ),
          ],
        ),
      ),
    );
  }
}
