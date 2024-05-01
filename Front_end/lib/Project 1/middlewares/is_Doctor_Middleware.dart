// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';

class isDoctorMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Auth!.getString('logedIn') == 'true' &&
        Auth!.getString('is_Doctor') == 'false') {
      return const RouteSettings(name: 'StudentHomePageScreen');
    } else if (Auth!.getString('logedIn') == 'true' &&
        Auth!.getString('is_Doctor') == 'true') {
      return const RouteSettings(name: 'DoctorHomePageScreen');
    }

    return null;
  }
}
