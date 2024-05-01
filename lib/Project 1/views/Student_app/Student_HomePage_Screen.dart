// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';

class StudentHomePageScreen extends StatelessWidget {
  const StudentHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: is_Dark!.getString('is_dark') == 'true'
          ? Themes.darkColorScheme.background
          : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ITE',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ));
  }
}
