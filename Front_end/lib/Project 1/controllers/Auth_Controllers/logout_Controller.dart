// ignore_for_file: file_names, missing_required_param

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../main.dart';
import '../../models/snackBar.dart';

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
        // successfull go to homePageDoctor :
        if (decodedResposne["status"] == 200) {
          Auth!.setString('user', 'non_active_doctor');
          Get.offNamed('EmailPageScreen');
        } else {
          snackBar sb = snackBar(
            path: 'assets/images/cross.png',
            messageLabel: 'some thing went wrong try again.',
            titleLabel: 'Error!',
          );
          sb.snackbar();
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
        // successfull go to homePageDoctor :
        if (decodedResposne["status"] == 200) {
          Auth!.setString('user', 'non_active_teacher');
          Get.offNamed('EmailPageScreen');
        } else {
          snackBar sb = snackBar(
            path: 'assets/images/cross.png',
            messageLabel: 'some thing went wrong try again.',
            titleLabel: 'Error!',
          );
          sb.snackbar();
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
        // successfull go to homePageDoctor :
        if (decodedResposne["status"] == 200) {
          Auth!.setString('user', 'non_active_student');
          Get.offNamed('EmailPageScreen');
        } else {
          snackBar sb = snackBar(
            path: 'assets/images/cross.png',
            messageLabel: 'some thing went wrong try again.',
            titleLabel: 'Error!',
          );
          sb.snackbar();
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
