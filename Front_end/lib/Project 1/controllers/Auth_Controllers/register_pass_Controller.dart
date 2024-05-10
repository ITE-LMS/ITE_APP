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

class RegisterPassController extends GetxController {
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
      update(["CIRPass"]);
      // set username and password in cache :
      Auth!.setString('user_name', user_name.text);
      Auth!.setString('user_password', pass_word.text);
      // set password doctor :
      if (Auth!.getString('user') == 'non_active_doctor') {
        try {
          var url = Uri.parse('http://10.0.2.2:8000/api/set-password-doctor');
          final response = await http.post(
            url,
            headers: {
              "Authorization": "Bearer ${Auth!.getString('token')}",
            },
            body: {
              "password": pass_word.text,
            },
          );

          final decodedResposne = json.decode(response.body);
          // successfull go to homePageDoctor :
          if (decodedResposne["status"] == 200) {
            if (Auth!.getString('user') == 'non_active_doctor') {
              Auth!.setString('user', 'active_doctor');
            }
            Get.offAllNamed('StudentHomePageScreen');
          } else {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'something went wrong',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["CIRPass"]);
          }
        } catch (e) {
          log(e.toString());
        }
      }
      // set password student :
      else if (Auth!.getString('user') == 'non_active_student') {
        try {
          var url = Uri.parse('http://10.0.2.2:8000/api/set-password-student');
          final response = await http.post(
            url,
            headers: {
              "Authorization": "Bearer ${Auth!.getString('token')}",
            },
            body: {
              "password": pass_word.text,
            },
          );
          final decodedResposne = json.decode(response.body);
          // successfull go to homePageDoctor :
          if (decodedResposne["status"] == 200) {
            if (Auth!.getString('user') == 'non_active_student') {
              Auth!.setString('user', 'active_student');
            }
            Get.offAllNamed('StudentHomePageScreen');
          } else {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'something went wrong',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["CIRPass"]);
          }
        } catch (e) {
          log(e.toString());
        }
      }
      // set password teacher :
      else if (Auth!.getString('user') == 'non_active_teacher') {
        try {
          var url = Uri.parse('http://10.0.2.2:8000/api/set-password-teacher');
          final response = await http.post(
            url,
            headers: {
              "Authorization": "Bearer ${Auth!.getString('token')}",
            },
            body: {
              "password": pass_word.text,
            },
          );
          final decodedResposne = json.decode(response.body);
          // successfull go to homePageDoctor :
          if (decodedResposne["status"] == 200) {
            if (Auth!.getString('user') == 'non_active_teacher') {
              Auth!.setString('user', 'active_teacher');
            }
            Get.offAllNamed('StudentHomePageScreen');
          } else {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'something went wrong',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["CIRPass"]);
          }
        } catch (e) {
          log(e.toString());
        }
      }
    } else {
      return;
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
