// ignore_for_file: non_constant_identifier_names , file_names, unused_local_variable, unrelated_type_equality_checks, missing_required_param

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project 1/models/Themes.dart';
import 'package:http/http.dart' as http;
import 'package:public_testing_app/Project%201/models/snackBar.dart';
import 'package:public_testing_app/main.dart';

class EmailController extends GetxController {
  final Form_Key = GlobalKey<FormState>();
  //Controllers :
  final email = TextEditingController();

  bool circle = false;

  void onSave() async {
    // validate the user credintials :
    if (Form_Key.currentState!.validate()) {
      Form_Key.currentState!.save();
      //set circle indicater :
      circle = true;
      update();
      try {
        // email url :
        var url = Uri.parse('http://10.0.2.2:8000/api/log_in_by_email');
        var response = await http.post(url, body: {
          'email': email.text,
        });

        // decoded response :
        final decodedResponse = json.decode(response.body);

        //active user :
        if (decodedResponse["status"] == 200) {
          //active doctor :
          if (decodedResponse["message"] == "active_doctor") {
            Auth!.setString('user', 'active_doctor');
          }
          // active teacher :
          else if (decodedResponse["message"] == "active_teacher") {
            Auth!.setString('user', 'active_teacher');
          }
          // active student :
          else if (decodedResponse["message"] == "active_student") {
            Auth!.setString('user', 'active_student');
          }
          Get.toNamed('loginPassPageScreen');
        }
        // non active user :
        else if (decodedResponse["status"] == 201) {
          //non_active doctor :
          if (decodedResponse["message"] == "non_active_doctor") {
            Auth!.setString('user', 'non_active_doctor');
          }
          // non_active teacher :
          else if (decodedResponse["message"] == "non_active_teacher") {
            Auth!.setString('user', 'non_active_teacher');
          }
          // non_active student :
          else if (decodedResponse["message"] == "non_active_student") {
            Auth!.setString('user', 'non_active_student');
          }
          Get.toNamed('VerificationPageScreen');
        }
        // user doesn`t exist : 404
        else if (decodedResponse["status"] == 404) {
          snackBar sb = snackBar(
            titleLabel: 'Error!',
            messageLabel: 'Sorry Email Not Found.',
            path: 'assets/images/cross.png',
          );
          sb.snackbar();
        }
        // save the user email :
        Auth!.setString('email', email.text);
        circle = false;
        update();
      }
      // catch the error :
      catch (e) {
        log('error is : $e');
        circle = false;
        update();
      }
    } else {
      return;
    }
  }

  @override
  void dispose() {
    email.dispose();
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
