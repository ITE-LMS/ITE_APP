// ignore_for_file: non_constant_identifier_names , file_names, unused_local_variable, missing_required_param

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/components/elevatedButton.dart';
import 'package:public_testing_app/Project%201/models/snackBar.dart';
import 'package:public_testing_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:public_testing_app/Project 1/models/Themes.dart';
//import 'package:public_testing_app/main.dart';

class VerificationController extends GetxController {
  final Form_Key = GlobalKey<FormState>();
  Timer? timer;
  int remainingSeconds = 1;
  int seconds = 60;
  int counter = 0;
  RxString time = '00:00'.obs;
  Widget? circle;

  //Controllers :
  final code = TextEditingController();
  String verificationID = '';

  void onSave() async {
    if (Form_Key.currentState!.validate()) {
      Form_Key.currentState!.save();

      // circle indicater :
      circle = const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      );
      update(["circleIndicater"]);

      // teacher verification code :
      if (Auth!.getString('user') == 'non_active_teacher') {
        try {
          // email url :
          var url =
              Uri.parse('http://10.0.2.2:8000/api/log_in_teacher_by_code');
          var response = await http.post(url, body: {
            'email': Auth!.getString('email'),
            'verificati00onCode': code.text,
          });

          // decoded response :
          final decodedResponse = json.decode(response.body);

          // verfication code is true :
          if (decodedResponse["status"] == 200) {
            Auth!.setString("token", "${decodedResponse["data"]["token"]}");
            circle = null;
            update(["circleIndicater"]);
            Get.toNamed('RegisterPassPageScreen');
          }
          //verfication code is false :
          else if (decodedResponse["status"] == 201) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'Wrong Code !',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["circleIndicater"]);
          }
        } catch (e) {
          log(
            e.toString(),
          );
        }
      }
      // doctor verification code :
      else if (Auth!.getString('user') == 'non_active_doctor') {
        try {
          // email url :
          var url = Uri.parse('http://10.0.2.2:8000/api/log_in_doctor_by_code');
          var response = await http.post(url, body: {
            'email': Auth!.getString('email'),
            'verificationCode': code.text,
          });
          // decoded response :
          final decodedResponse = json.decode(response.body);
          // verfication code is true :
          if (decodedResponse["status"] == 200) {
            Auth!.setString("token", "${decodedResponse["data"]["token"]}");
            circle = null;
            update(["circleIndicater"]);
            Get.toNamed('RegisterPassPageScreen');
          }
          //verfication code is false :
          else if (decodedResponse["status"] == 201) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'Wrong Code !',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["circleIndicater"]);
          }
        } catch (e) {
          log(
            e.toString(),
          );
        }
      }
      // student verification code :
      else if (Auth!.getString('user') == 'non_active_student') {
        try {
          // email url :
          var url =
              Uri.parse('http://10.0.2.2:8000/api/log_in_student_by_code');
          var response = await http.post(url, body: {
            'email': Auth!.getString('email'),
            'VerificationCode': code.text,
          });

          // decoded response :
          final decodedResponse = json.decode(response.body);

          // verfication code is true :
          if (decodedResponse["status"] == 200) {
            Auth!.setString("token", "${decodedResponse["data"]["token"]}");
            circle = null;
            update(["circleIndicater"]);
            Get.toNamed('RegisterPassPageScreen');
          }
          //verfication code is false :
          else if (decodedResponse["status"] == 201) {
            snackBar sb = snackBar(
              path: 'assets/images/cross.png',
              messageLabel: 'Wrong Code !',
              titleLabel: 'Error !',
            );
            sb.snackbar();
            circle = null;
            update(["circleIndicater"]);
          }
        } catch (e) {
          log(
            e.toString(),
          );
        }
      }
    } else {
      return;
    }
  }

  void ResendCode() async {
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

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(
      duration,
      (Timer timer) {
        if (remainingSeconds != -1) {
          int min = remainingSeconds ~/ 60;
          int sec = remainingSeconds % 60;
          time.value =
              '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
          remainingSeconds--;
        } else {
          timer.cancel();
          update(['resend_code']);
        }
      },
    );
  }

  @override
  void onReady() {
    if (counter == 0) {
      startTimer(seconds);
    } else if (counter == 1) {
      startTimer(seconds * 5);
    } else if (counter == 2) {
      startTimer(seconds * 10);
    } else if (counter == 3) {
      startTimer(seconds * 30);
    } else {
      Get.defaultDialog(
        title: '',
        content: const Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: CircleAvatar(
                radius: 48,
                child: Image(
                  image: AssetImage('assets/images/cross.png'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Too many attempts reLogin please!',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        contentPadding: const EdgeInsets.only(bottom: 15),
        confirm: MyElevetedButton(
          label: 'OK',
          onTap: () {
            Get.offAllNamed('EmailPageScreen');
          },
          width: 7,
          height: 25,
          BackColor: is_Dark!.getString('is_dark') == 'true'
              ? Themes.darkColorScheme.onSecondary
              : Themes.colorScheme.onSecondary,
        ),
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.onPrimary
            : Themes.colorScheme.onPrimary,
        barrierDismissible: false,
      );
    }
    super.onReady();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  @override
  void dispose() {
    code.dispose();
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
