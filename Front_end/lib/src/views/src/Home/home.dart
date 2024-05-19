// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Home/Home_Controller.dart';
//import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Home/HomeCard.dart';
import 'package:public_testing_app/src/views/src/Home/Recent_Files.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    List<Widget> content = [];
    return GetBuilder<HomeController>(
        id: 'seeAll',
        init: HomeController(),
        builder: (h_controller) {
          if (controller.isSeeAll == false) {
            content = [
              const SizedBox(height: 10),
              HomeCard(
                leading: '1',
                title: 'First Year',
                onTap: () {},
              ),
              const SizedBox(height: 5),
              HomeCard(
                leading: '2',
                title: 'Second Year',
                onTap: () {},
              ),
              const SizedBox(height: 5),
              HomeCard(
                leading: '3',
                title: 'Third Year',
                onTap: () {},
              ),
              const SizedBox(height: 10),
            ];
          } else {
            content = [];
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...content,
              RecentFiles(
                onTap: () {
                  controller.isSeeAll = !controller.isSeeAll;
                  controller.update(['seeAll']);
                },
              ),
            ],
          );
        });
  }
}
