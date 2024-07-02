// ignore_for_file: non_constant_identifier_names, missing_required_param

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:public_testing_app/src/models/Themes.dart';
import '../../../../main.dart';
import '../../../models/SnackBar.dart';

class ChangePassController extends GetxController {
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirm_new_pass_word = TextEditingController();
  bool isSecurePassword = true;
  bool isSecureNewPassword = true;
  bool isSecureConfirmNewPassword = true;

  final formkey = GlobalKey<FormState>();
  bool circle2 = false;

  void onChangePass() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
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
              'old_password': oldPass.text,
              'new_password': newPass.text,
              "confirm_password": confirm_new_pass_word.text,
            },
          );
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
          }
          // wrong confirm pass :
          else if (decodedResponse["status"] == 401) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Confirm new password and new password isn`t the same.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 30,
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
          // some thing went wrong :
          else if (decodedResponse["status"] == 400) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Wrong Password.',
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
          } else {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'SomeThing Went Wrong.',
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
              'old_password': oldPass.text,
              'new_password': newPass.text,
              "confirm_password": confirm_new_pass_word.text,
            },
          );
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
          }
          // wrong confirm pass :
          else if (decodedResponse["status"] == 401) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Confirm new password and new password isn`t the same.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 40,
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
          // some thing went wrong :
          else if (decodedResponse["status"] == 400) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Wrong Password.',
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
              "confirm_password": confirm_new_pass_word.text,
            },
          );
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
          }
          // wrong confirm pass :
          else if (decodedResponse["status"] == 401) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Confirm new password and new password isn`t the same.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.mediaQuery.size.width / 40,
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
          // wrong password :
          else if (decodedResponse["status"] == 400) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              BorderColor: Colors.redAccent,
              message: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Wrong Password.',
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
          // some thing went wrong :
          else {
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
              color: Themes.getColor(
                Themes.darkColorScheme.primary,
                Themes.colorScheme.primary,
              ),
            )
          : Image(
              image: const AssetImage('assets/images/show.png'),
              width: 28,
              height: 28,
              color: Themes.getColor(
                Themes.darkColorScheme.primary,
                Themes.colorScheme.primary,
              ),
            ),
    );
  }

  Widget toggleNewPassWord() {
    return IconButton(
      onPressed: () {
        isSecureNewPassword = !isSecureNewPassword;
        update(['new_pass']);
      },
      icon: isSecureNewPassword
          ? Image(
              image: const AssetImage('assets/images/eye.png'),
              width: 28,
              height: 28,
              color: Themes.getColor(
                Themes.darkColorScheme.primary,
                Themes.colorScheme.primary,
              ),
            )
          : Image(
              image: const AssetImage('assets/images/show.png'),
              width: 28,
              height: 28,
              color: Themes.getColor(
                Themes.darkColorScheme.primary,
                Themes.colorScheme.primary,
              ),
            ),
    );
  }

  Widget toggleConfirmNewPassWord() {
    return IconButton(
      onPressed: () {
        isSecureConfirmNewPassword = !isSecureConfirmNewPassword;
        update(['confirm_new_pass']);
      },
      icon: isSecureConfirmNewPassword
          ? Image(
              image: const AssetImage('assets/images/eye.png'),
              width: 28,
              height: 28,
              color: Themes.getColor(
                Themes.darkColorScheme.primary,
                Themes.colorScheme.primary,
              ),
            )
          : Image(
              image: const AssetImage('assets/images/show.png'),
              width: 28,
              height: 28,
              color: Themes.getColor(
                Themes.darkColorScheme.primary,
                Themes.colorScheme.primary,
              ),
            ),
    );
  }
}
