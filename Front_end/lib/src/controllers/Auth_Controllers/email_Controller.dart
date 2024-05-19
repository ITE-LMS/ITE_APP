// ignore_for_file: non_constant_identifier_names , file_names, unused_local_variable, unrelated_type_equality_checks, missing_required_param

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:http/http.dart' as http;
import 'package:public_testing_app/src/models/SnackBar.dart';
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
            path: 'assets/images/cross.png',
            BorderColor: Colors.redAccent,
            message: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Sorry Email Not Found.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Error!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
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
        statusBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
        systemNavigationBarColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.primary
            : Themes.colorScheme.primary,
      ),
    );
    super.onInit();
  }
}
