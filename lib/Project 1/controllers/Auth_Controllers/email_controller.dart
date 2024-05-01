// ignore_for_file: non_constant_identifier_names , file_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';
//import 'package:http/http.dart' as http;

class EmailController extends GetxController {
  final Form_Key = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  //Controllers :
  final email = TextEditingController();
  final phone_number = TextEditingController();

  void onSave() async {
    if (Form_Key.currentState!.validate()) {
      Form_Key.currentState!.save();

      Auth!.setString('email', email.text);
      // Auth!.setString('email&verification', 'false');

      // var url = Uri.parse('http://10.0.2.2/api/email');
      // var response = await http.post(url, body: {
      //   'email': email.text,
      // });
      // if (response.statusCode == 200) {
      // Get.offAllNamed('PassPageScreen');
      // }
      // else if (response.statusCode == 400){
      Get.offAllNamed('VerificationPageScreen');
      // }
    } else {
      return;
    }
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

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //check if googleUser is null :
    if (googleUser == null) {
      return;
    }
    Auth!.setString('email', googleUser.email);
    Auth!.setString('email&verification', 'false');
    // var url = Uri.parse('http://10.0.2.2/api/login');
    // var response = await http.post(url, body: {
    //   'email': email.text,
    // });
    // if (response.statusCode == 200) {
    // Auth!.setString('active', 'true');
    //Get.offAllNamed('PassPageScreen');
    // }
    // else if (response.statusCode == 400){
    Auth!.setString('is_Doctor', 'false');

    // }
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
