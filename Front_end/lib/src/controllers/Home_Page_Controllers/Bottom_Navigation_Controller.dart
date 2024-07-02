// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/views/src/AI_Assistant/Intro.dart';
import 'package:public_testing_app/src/views/src/Courses/All_Courses.dart';
import 'package:public_testing_app/src/views/src/Home/first_Page/home.dart';
import 'package:public_testing_app/src/views/src/MySubject/My_Subjects_Student/first_Page/My_Subjects.dart';
import 'package:public_testing_app/src/views/src/Quizes/Doctor_Quizzes/quiz_screens_doctor/quiz_screen.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;

  final List<StatelessWidget> StudentSCreens = [
    const Home(),
    const AllCourses(),
    const MySubjects(),
    const Placeholder(),
    const Intro(),
  ];

  final List<StatelessWidget> OtherUsersScreens = [
    const MySubjects(),
    const QuizScreen(),
    const Intro(),
  ];
}
