// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Courses_Controllers/Courses_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Courses/vedioeSection.dart';

import 'package:public_testing_app/src/widgets/Material.dart';

// ignore: must_be_immutable
class Course extends StatelessWidget {
  const Course({
    super.key,
    required this.name,
    required this.desc,
    required this.index,
  });

  final String name;
  final String desc;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cs_controller = Get.put(CoursesController());

    return Scaffold(
      backgroundColor: Themes.getColor(
          Themes.darkColorScheme.background.withOpacity(.9), Colors.white),
      appBar: AppBar(
        backgroundColor: Themes.getColor(
            Themes.darkColorScheme.background.withOpacity(.9), Colors.white),
        title: Text(
          '$name :',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(cs_controller.path[index]),
                ),
              ),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 45,
                    color: Color(0xff674AEF),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '$name complete course',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyMaterial(
                    text: 'Videos',
                    isVideosSeecton: true,
                  ),
                  MyMaterial(text: 'discryption', isVideosSeecton: false),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            VideoSection(),
          ],
        ),
      ),
    );
  }
}
