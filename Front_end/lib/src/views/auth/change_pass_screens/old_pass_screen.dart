// ignore_for_file: file_names, body_might_complete_normally_nullable, invalid_use_of_protected_member, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/widgets/ElevatedButton.dart';
import 'package:public_testing_app/src/controllers/Auth_Controllers/change_pass_controller.dart';
import 'package:public_testing_app/src/widgets/TextFormField.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';
import '../Elements_For_Auth/Custom_Shape_top.dart';

class OldPassScreen extends StatelessWidget {
  const OldPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePassController());

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
    Widget check = Text(
      'Check',
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: Themes.getWidth(context) / 22,
            color: Colors.white,
          ),
    );

    Widget circle = const CircularProgressIndicator(
      color: Colors.white,
      strokeWidth: 2,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.background
            : Colors.white,
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
                      top: 130,
                      right: 0,
                      left: 0,
                      child: Image(
                        image: const AssetImage('assets/images/programmer.png'),
                        width: Themes.getWidth(context) / 3.5,
                        height: Themes.getHeight(context) / 6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                // Some Text
                Text(
                  'Reset Password',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: Themes.getWidth(context) / 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter Your Old Password please',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: Themes.getWidth(context) / 23),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 15),
                // Informations Fields :
                Form(
                  key: controller.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Email Text Field :
                      GetBuilder<ChangePassController>(
                        id: 'pass',
                        init: ChangePassController(),
                        builder: (controller) {
                          return MyTextFormField(
                            validate: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "password missing";
                              }
                              if (value.trim().length < 8) {
                                return "password too short";
                              }
                              if (value != Auth!.getString('user_password')) {
                                return "wrong password";
                              }
                            },
                            save: (value) {},
                            keyboard: TextInputType.text,
                            Pass_Security: controller.isSecurePassword,
                            suffixIcon: controller.togglePassWord(),
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            label: 'Password',
                          );
                        }
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // check from old password :
                GetBuilder<ChangePassController>(
                  init: ChangePassController(),
                  builder: (circle_controller) {
                    return MyElevetedButton(
                      onTap: () {
                        if (controller.formkey.currentState!.validate()) {
                          Get.toNamed('NewPassPageScreen');
                        }
                      },
                      widget: check,
                      width: 3.6,
                      height: 35,
                      BackColor:
                          Theme.of(context).colorScheme.primary.withOpacity(.7),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: Themes.getWidth(context) / 18,
                      ),
                      child: MyElevetedButton(
                        onTap: () {
                          Get.back();
                        },
                        widget: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_rounded,
                              color: is_Dark!.getString('is_dark') == 'true'
                                  ? Colors.white
                                  : Colors.black,
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
                                      fontSize: Themes.getWidth(context) / 25),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
