// ignore_for_file: non_constant_identifier_names , file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';
// import 'package:public_testing_app/main.dart';
// import 'package:http/http.dart' as http;

class PasswordController extends GetxController {
  final Form_Key = GlobalKey<FormState>();

  //Controllers :
  final user_name = TextEditingController();
  final pass_word = TextEditingController();
  bool isSecurePassword = true;

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

  void onSave() async {
    if (Form_Key.currentState!.validate()) {
      Form_Key.currentState!.save();
      Auth!.setString('user_name', user_name.text);
      // var url = Uri.parse('https://10.0.2.2/api/login');
      // var response = await http.post(url, body: {
      //   'password': pass_word.text,
      // });
      // if (response.statusCode == 200) {
      Get.offAllNamed('StudentHomePageScreen');
      Auth!.setString('is_Doctor', 'false');
      // }
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
    super.dispose();
  }
}
