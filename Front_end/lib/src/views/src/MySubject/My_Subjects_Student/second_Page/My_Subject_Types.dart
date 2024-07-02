// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/My_Subjects_Controllers/Student_Subjects_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Home/third_Page/subjectTypeCard.dart';

class MySubjectstypes extends StatelessWidget {
  const MySubjectstypes({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final student_subject_controller = Get.put(StudentSubjectsController());
    final width = Themes.getWidth(context);
    final height = Themes.getHeight(context);

    List<Widget> thP = [
      SubjectTypeCard(
        year: student_subject_controller.year_id[index],
        subject_name: student_subject_controller.student_subjects[index],
        Type: 'Theoritical :',
        Doctors_Names: '',
        path: 'assets/images/design.png',
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.background.withOpacity(.9)
            : Colors.white,
        // AppBar decoration:
        appBar: AppBar(
          backgroundColor: is_Dark!.getString('is_dark') == 'true'
              ? Themes.darkColorScheme.background
              : Themes.colorScheme.primaryContainer,
          title: Text(
            '${index + 1} . ${student_subject_controller.student_subjects[index]}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: width / 20,
                  color: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.primary
                      : Themes.colorScheme.primary,
                ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: width,
              height: width / 12,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Colors.green.withGreen(255)
                        : Colors.blue.withBlue(255),
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 1),
                    blurRadius: 7,
                  )
                ],
                color: is_Dark!.getString('is_dark') == 'true'
                    ? Themes.darkColorScheme.background
                    : Themes.colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...thP,
          ],
        ),
      ),
    );
  }
}
