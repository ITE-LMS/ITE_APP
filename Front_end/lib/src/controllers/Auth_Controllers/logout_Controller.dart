// ignore_for_file: file_names, missing_required_param

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:public_testing_app/src/models/Themes.dart';
import '../../../main.dart';
import '../../models/SnackBar.dart';

class LogoutController extends GetxController {
  void onLogOut() async {
    if (Auth!.getString('user') == 'active_doctor') {
      try {
        var url = Uri.parse('http://10.0.2.2:8000/api/logout-doctor');
        final response = await http.get(
          url,
          headers: {
            "Authorization": "Bearer ${Auth!.getString('token')}",
          },
        );
        final decodedResposne = json.decode(response.body);
        // successfull logout :
        if (decodedResposne["status"] == 200) {
          Auth!.setString('user', 'non_active_doctor');
          Get.offNamed('EmailPageScreen');
          Auth!.setString('token', 'logged out');
          Auth!.setString('login', '400');
        } else {
          Themes.get_notification_info("cross", "SomeThing Went", "Wrong!");
        }
      } catch (e) {
        log(e.toString());
      }
    }
    // teacher logout :
    else if (Auth!.getString('user') == 'active_teacher') {
      try {
        var url = Uri.parse('http://10.0.2.2:8000/api/logout-teacher');
        final response = await http.get(
          url,
          headers: {
            "Authorization": "Bearer ${Auth!.getString('token')}",
          },
        );
        final decodedResposne = json.decode(response.body);
        // successfull logout :
        if (decodedResposne["status"] == 200) {
          Auth!.setString('user', 'non_active_teacher');
          Get.offNamed('EmailPageScreen');
          Auth!.setString('token', 'logged out');
          Auth!.setString('login', '400');
        } else {
          Themes.get_notification_info("cross", "SomeThing Went", "Wrong!");
        }
      } catch (e) {
        log(e.toString());
      }
    }
    // student logout :
    else if (Auth!.getString('user') == 'active_student') {
      try {
        var url = Uri.parse('http://10.0.2.2:8000/api/logout-student');
        final response = await http.get(
          url,
          headers: {
            "Authorization": "Bearer ${Auth!.getString('token')}",
          },
        );
        final decodedResposne = json.decode(response.body);
        // successfull logout :
        if (decodedResposne["status"] == 200) {
          Auth!.setString('user', 'non_active_student');
          Get.offNamed('EmailPageScreen');
          Auth!.setString('token', 'logged out');
          Auth!.setString('login', '400');
        } else {
          Themes.get_notification_info("cross", "SomeThing Went", "Wrong!");
        }
      } catch (e) {
        log(e.toString());
      }
    }
    appData!.setString('user_photo', '');
  }
}
