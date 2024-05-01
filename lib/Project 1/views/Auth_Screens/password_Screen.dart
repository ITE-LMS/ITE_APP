// ignore_for_file: file_names, body_might_complete_normally_nullable, invalid_use_of_protected_member, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/components/elevatedButton.dart';
import 'package:public_testing_app/Project%201/controllers/Auth_Controllers/pass_Controller.dart';
import 'package:public_testing_app/Project%201/components/TextFormField.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';
import 'Elements_For_Auth/Custom_Shape_top.dart';
import 'package:google_sign_in/google_sign_in.dart';

final PasswordController controller = Get.put(PasswordController());

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    List<Widget> content = [const SizedBox(height: 15)];
    if (Auth!.getString('email&verification') == 'false') {
      content = [
        const SizedBox(height: 15),
        // Forgot PassWord :
        Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.offAllNamed('VerificationPageScreen');
                },
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: MediaQuery.of(context).size.width / 25,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ];
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Get.isDarkMode ? Themes.darkColorScheme.background : Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CustomShapeTop(),
                    Positioned(
                      top: 100,
                      right: 0,
                      left: 0,
                      child: Image(
                        image: const AssetImage('assets/images/programmer.png'),
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                // Some Text
                Text(
                  Auth!.getString('email&verification') == 'false'
                      ? 'Log in'
                      : 'Register',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: MediaQuery.of(context).size.width / 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  Auth!.getString('email&verification') == 'false'
                      ? 'Welcome Back !'
                      : 'Glad To Meet You !',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MediaQuery.of(context).size.width / 28),
                ),
                const SizedBox(height: 15),
                // Informations Fields :
                Form(
                  key: controller.Form_Key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //user name text field :
                      MyTextFormField(
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "user name missing";
                          }
                          if (value.trim().length < 3) {
                            return "user name too short";
                          }
                          if (int.tryParse(value) != null) {
                            return 'invalid username';
                          }
                        },
                        save: (value) {
                          controller.user_name.text = value!;
                        },
                        keyboard: TextInputType.text,
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: 'User name',
                      ),
                      const SizedBox(height: 10),
                      // PassWord Text Field :
                      GetBuilder<PasswordController>(
                        init: PasswordController(),
                        builder: (controller) {
                          return MyTextFormField(
                            validate: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "password missing";
                              }
                              if (value.trim().length < 8) {
                                return "password too short";
                              }
                            },
                            save: (value) {
                              controller.pass_word.text = value!;
                            },
                            Pass_Security: controller.isSecurePassword,
                            keyboard: TextInputType.text,
                            suffixIcon: controller.togglePassWord(),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            label:
                                Auth!.getString('email&verification') == 'false'
                                    ? 'Enter password'
                                    : 'Set password',
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ...content,
                const SizedBox(height: 15),
                // Login Button :
                MyElevetedButton(
                  onTap: () => controller.onSave(),
                  label: Auth!.getString('email&verification') == 'false'
                      ? 'Log in'
                      : 'Register',
                  width: 3.6,
                  height: 35,
                  BackColor:
                      Theme.of(context).colorScheme.primary.withOpacity(.7),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20,
                      ),
                      child: MyElevetedButton(
                        onTap: () async {
                          await GoogleSignIn().signOut();
                          Get.offAllNamed('EmailPageScreen');
                        },
                        widget: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_rounded,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              25),
                            ),
                          ],
                        ),
                        width: 20,
                        height: 35,
                        BackColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
