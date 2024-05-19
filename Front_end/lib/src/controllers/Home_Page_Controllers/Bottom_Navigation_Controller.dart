// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:public_testing_app/src/views/src/Courses/courses.dart';
import 'package:public_testing_app/src/views/src/Home/home.dart';
import 'package:public_testing_app/src/views/src/MySubject/mySubject.dart';
import 'package:public_testing_app/src/views/src/Quizes/quizes.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;

  final screens = [
    const Home(),
    const MySubject(),
    const Courses(),
    const Quizes(),
  ];
}
