// ignore_for_file: non_constant_identifier_names , file_names, unused_local_variable, missing_required_param

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project 1/models/Themes.dart';
import 'package:public_testing_app/Project%201/models/snackBar.dart';
import 'package:public_testing_app/main.dart';
import 'package:http/http.dart' as http;

class LoginPassController extends GetxController {
  final Form_Key = GlobalKey<FormState>();
  Widget? circle;

  //Controllers :
  final user_name = TextEditingController();
  final pass_word = TextEditingController();
  bool isSecurePassword = true;

  void onSave() async {
    if (Form_Key.currentState!.validate()) {
      Form_Key.currentState!.save();
      // activate the circle indecater :
      circle = const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      );
      update(["CILPass"]);
      // set username and password in cache :
      Auth!.setString('user_name', user_name.text);
      Auth!.setString('user_password', pass_word.text);
      // check password doctor :
      if (Auth!.getString('user') == 'active_doctor') {
        try {
          var url =
              Uri.parse('http://10.0.2.2:8000/api/log_in_doctor_by_password');
          final response = await http.post(
            url,
            body: {
              "email": Auth!.getString('email'),
              "password": pass_word.text,
            },
          );
          final decodedResposne = json.decode(response.body);
          // successfull go to homePageDoctor :
          if (decodedResposne["status"] == 200) {
            Auth!.setString('token', "${decodedResposne["data"]["token"]}");
            Auth!.setString('login', '200');
            Get.offAllNamed('StudentHomePageScreen');
          } else if (decodedResposne["status"] == 201) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'Wrong Password.',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["CILPass"]);
          }
        } catch (e) {
          log(e.toString());
        }
      }
      // check password teacher :
      else if (Auth!.getString('user') == 'active_teacher') {
        try {
          var url =
              Uri.parse('http://10.0.2.2:8000/api/log_in_teacher_by_password');
          final response = await http.post(
            url,
            body: {
              "email": Auth!.getString('email'),
              "password": pass_word.text,
            },
          );
          final decodedResposne = json.decode(response.body);
          // successfull go to homePageDoctor :
          if (decodedResposne["status"] == 200) {
            Auth!.setString('token', "${decodedResposne["data"]["token"]}");
            Auth!.setString('login', '200');
            Get.offAllNamed('StudentHomePageScreen');
          } else if (decodedResposne["status"] == 201) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'Wrong Password.',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["CILPass"]);
          }
        } catch (e) {
          log(e.toString());
        }
      }
      // check password student :
      else if (Auth!.getString('user') == 'active_student') {
        try {
          var url =
              Uri.parse('http://10.0.2.2:8000/api/log_in_student_by_password');
          final response = await http.post(
            url,
            body: {
              "email": Auth!.getString('email'),
              "password": pass_word.text,
            },
          );
          final decodedResposne = json.decode(response.body);
          // successfull go to homePageDoctor :
          if (decodedResposne["status"] == 200) {
            Auth!.setString('token', "${decodedResposne["data"]["token"]}");
            Auth!.setString('login', '200');
            Get.offAllNamed('StudentHomePageScreen');
          } else if (decodedResposne["status"] == 201) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'Wrong Password.',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["CILPass"]);
          }
        } catch (e) {
          log(e.toString());
        }
      }
    } else {
      return;
    }
  }

  void onForgotPassword() async {
    // set the teacher to non active :
    if (Auth!.getString('user') == 'active_teacher') {
      Auth!.setString('user', 'non_active_teacher');
    }
    // set the doctor to non active :
    else if (Auth!.getString('user') == 'active_doctor') {
      Auth!.setString('user', 'non_active_doctor');
    }
    // set the student to non active :
    else if (Auth!.getString('user') == 'active_student') {
      Auth!.setString('user', 'non_active_student');
    }
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/forget-password');
      final response = await http.post(
        url,
        body: {
          "email": Auth!.getString('email'),
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Widget togglePassWord() {
    return IconButton(
      onPressed: () {
        isSecurePassword = !isSecurePassword;
        update();
      },
      icon: isSecurePassword
          ? Image(
              image: const AssetImage('assets/images/eye.png'),
              width: 28,
              height: 28,
              color: Get.isDarkMode
                  ? Themes.darkColorScheme.primary
                  : Themes.colorScheme.primary,
            )
          : Image(
              image: const AssetImage('assets/images/show.png'),
              width: 28,
              height: 28,
              color: Get.isDarkMode
                  ? Themes.darkColorScheme.primary
                  : Themes.colorScheme.primary,
            ),
    );
  }

  @override
  void dispose() {
    user_name.dispose();
    pass_word.dispose();
    log(Auth!.getString('user')!);
    super.dispose();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Get.isDarkMode
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
        systemNavigationBarColor: Get.isDarkMode
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
      ),
    );
    super.onInit();
  }
}
