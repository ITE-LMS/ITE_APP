// ignore_for_file: non_constant_identifier_names, missing_required_param

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:public_testing_app/src/models/Themes.dart';
import '../../../main.dart';
import '../../models/SnackBar.dart';

class ChangePassController extends GetxController {
  final newPass = TextEditingController();
  bool isSecurePassword = true;

  final Form_Key = GlobalKey<FormState>();
  final formkey = GlobalKey<FormState>();
  bool circle2 = false;

  void onChangePass() async {
    if (Form_Key.currentState!.validate()) {
      Form_Key.currentState!.save();
      circle2 = true;
      update();
      // reset password doctor :
      if (Auth!.getString('user') == 'active_doctor') {
        try {
          // email url :
          var url = Uri.parse('http://10.0.2.2:8000/api/reset-password-doctor');
          var response = await http.post(
            url,
            headers: {
              "Authorization": "Bearer ${Auth!.getString('token')}",
            },
            body: {
              'old_password': Auth!.getString('user_password'),
              'new_password': newPass.text,
            },
          );
          log(response.body);
          log(newPass.text);
          // decoded response :
          final decodedResponse = json.decode(response.body);
          if (decodedResponse["status"] == 200) {
            Auth!.setString('user_password', newPass.text);
            Get.back();
            Get.back();
            snackBar sb = snackBar(
              path: 'assets/images/check.png',
              BorderColor: Colors.greenAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Successfully!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Password Changed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
            );
            sb.snackbar();
          } else {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Wrong!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Something Went',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
            );
            sb.snackbar();
          }
          circle2 = false;
          update();
        } catch (e) {
          log(e.toString());
        }
      }
      // reset password teacher :
      else if (Auth!.getString('user') == 'active_teacher') {
        try {
          // email url :
          var url =
              Uri.parse('http://10.0.2.2:8000/api/reset-password-teacher');
          var response = await http.post(
            url,
            headers: {
              "Authorization": "Bearer ${Auth!.getString('token')}",
            },
            body: {
              'old_password': Auth!.getString('user_password'),
              'new_password': newPass.text,
            },
          );
          log(response.body);
          log(newPass.text);
          // decoded response :
          final decodedResponse = json.decode(response.body);
          if (decodedResponse["status"] == 200) {
            Auth!.setString('user_password', newPass.text);
            Get.back();
            Get.back();
            snackBar sb = snackBar(
              path: 'assets/images/check.png',
              BorderColor: Colors.greenAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Successfully!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Password Changed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
            );
            sb.snackbar();
          } else {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Wrong!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Something Went',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
            );
            sb.snackbar();
          }
          circle2 = false;
          update();
        } catch (e) {
          log(e.toString());
        }
      }
      // reset password student :
      else if (Auth!.getString('user') == 'active_student') {
        try {
          // email url :
          var url =
              Uri.parse('http://10.0.2.2:8000/api/reset-password-student');
          var response = await http.post(
            url,
            headers: {
              "Authorization": "Bearer ${Auth!.getString('token')}",
            },
            body: {
              'old_password': Auth!.getString('user_password'),
              'new_password': newPass.text,
            },
          );
          log(response.body);
          log(newPass.text);
          // decoded response :
          final decodedResponse = json.decode(response.body);
          if (decodedResponse["status"] == 200) {
            Auth!.setString('user_password', newPass.text);
            Get.back();
            Get.back();
            snackBar sb = snackBar(
              path: 'assets/images/check.png',
              BorderColor: Colors.greenAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Successfully!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Password Changed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
            );
            sb.snackbar();
          } else {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Wrong!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Something Went',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 25,
                  ),
                ),
              ),
            );
            sb.snackbar();
          }
          circle2 = false;
          update();
        } catch (e) {
          log(e.toString());
        }
      }
    }
  }

  Widget togglePassWord() {
    return IconButton(
      onPressed: () {
        isSecurePassword = !isSecurePassword;
        update(['pass']);
      },
      icon: isSecurePassword
          ? Image(
              image: const AssetImage('assets/images/eye.png'),
              width: 28,
              height: 28,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Themes.darkColorScheme.primary
                  : Themes.colorScheme.primary,
            )
          : Image(
              image: const AssetImage('assets/images/show.png'),
              width: 28,
              height: 28,
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Themes.darkColorScheme.primary
                  : Themes.colorScheme.primary,
            ),
    );
  }
}
