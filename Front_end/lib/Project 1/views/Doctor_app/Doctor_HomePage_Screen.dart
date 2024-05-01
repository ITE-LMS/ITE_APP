// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DoctorHomePageScreen extends StatelessWidget {
  const DoctorHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
