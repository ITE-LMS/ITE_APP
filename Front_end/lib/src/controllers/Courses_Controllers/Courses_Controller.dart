// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController {
  bool isVideoSection = true;
  bool isDiscryption = false;

  final List<String> ids = [
    '0sacQ4oo-P0',
  ];
  List name = [
    'flutter',
    'node js',
    'react',
    'c++',
    'laravel',
    'php',
  ];
  List<String> path = [
    'assets/images/Flutter.png',
    'assets/images/node.png',
    'assets/images/React.png',
    'assets/images/cpp.png',
    'assets/images/laravel.png',
    'assets/images/php.png',
  ];

  List desc = [
    'videos:55',
    'videos:35',
    'videos:54',
    'videos:22',
    'videos:45',
    'videos:13',
  ];
  List auther = [
    'Maxmilian',
    'Wael',
    'Mora Soft',
    'Simon',
    'Adel Nasim',
    'Tharwat ',
  ];
  List<Color> colors = [
    const Color(0xff50BEF0),
    Colors.green,
    Colors.blue,
    const Color(0xff004482),
    Colors.red,
    const Color(0xff8281AA),
  ];

  List subtitle = [
    '22 min 50 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
  ];
  List videos = [
    'introducton to flutter',
    'basics in flutter',
    'widgets in flutter',
    'state less  widget',
    'state full widget',
    'layout in flutter',
    'design in flutter',
    'animations in flutter',
    'navigation in flutter',
  ];
}
