// ignore_for_file: file_names, body_might_complete_normally_nullable, invalid_use_of_protected_member, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/Project%201/components/elevatedButton.dart';
import 'package:public_testing_app/Project%201/controllers/Auth_Controllers/email_Controller.dart';
import 'package:public_testing_app/Project%201/components/TextFormField.dart';
import 'package:public_testing_app/Project%201/views/Auth_Screens/Elements_For_Auth/SignIn_Container.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';
import 'Elements_For_Auth/Custom_Shape_top.dart';

final EmailController controller = Get.put(EmailController());

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    Widget content = MyElevetedButton(
      onTap: () {
        controller.onSave();
      },
      label: 'check',
      width: 3.6,
      height: 35,
      BackColor: Theme.of(context).colorScheme.primary.withOpacity(.7),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            is_Dark!.getString('is_dark') == 'true' ? Themes.darkColorScheme.background : Colors.white,
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
                      top: 70,
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
                const SizedBox(height: 40),
                // Some Text
                Text(
                  'Log in',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: MediaQuery.of(context).size.width / 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Glad To Meet You !',
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
                      // Email Text Field :
                      MyTextFormField(
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "email missing";
                          }
                          int index = 0;
                          for (int i = 0; i < value.length; i++) {
                            if (value[i] == '@') {
                              index = i;
                              break;
                            }
                          }
                          String email = value.substring(0, index);
                          if (int.tryParse(email) != null ||
                              double.tryParse(email) != null ||
                              email.length < 5) {
                            return "invalid email";
                          }
                        },
                        save: (value) {
                          controller.email.text = value!;
                        },
                        keyboard: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: 'Enter your ITE email',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Login Button :
                content,
                const SizedBox(height: 12),
                //Another Login Methods :
                Center(
                  child: Text(
                    'OR Sign in with',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 12),
                // sign in with google :
                SignInContainer(
                  leading: 'assets/images/google.png',
                  trailing: 'continue with google',
                  onTap: () {
                    controller.signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
