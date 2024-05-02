// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:public_testing_app/Project%201/components/elevatedButton.dart';
import 'package:public_testing_app/Project%201/controllers/Auth_Controllers/verification_controller.dart';
import 'package:public_testing_app/Themes.dart';
import 'package:public_testing_app/main.dart';
import 'Elements_For_Auth/Custom_Shape_top.dart';

VerificationController controller = Get.put(VerificationController());

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      top: 120,
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
                const SizedBox(height: 80),
                Text(
                  'Verification Code',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: MediaQuery.of(context).size.width / 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'enter the code that we have sent to your email ${Auth!.getString('email')}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MediaQuery.of(context).size.width / 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 0.75,
                  child: Form(
                    key: controller.Form_Key,
                    child: Pinput(
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                        height: MediaQuery.of(context).size.width / 8,
                        width: MediaQuery.of(context).size.width / 7.7,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.onPrimaryContainer,
                              Theme.of(context).colorScheme.secondaryContainer,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'missin code';
                        } else if (int.tryParse(value) == null) {
                          return 'enter a valid code';
                        } else if (value.length != 6) {
                          return 'complete the code';
                        }
                      },
                      onCompleted: (value) {
                        controller.code.text = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 15),
                  child: Row(
                    children: [
                      Text(
                        'doesn`t recieve any code?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 5),
                      GetBuilder<VerificationController>(
                          id: 'resend_code',
                          init: VerificationController(),
                          builder: (timeController) {
                            return GestureDetector(
                              onTap: () {
                                if (timeController.remainingSeconds <= 0) {
                                  timeController.timer!.cancel();
                                  timeController.counter++;
                                  timeController.onReady();
                                  timeController.update(['resend_code']);
                                }
                              },
                              child: timeController.remainingSeconds <= 0
                                  ? Text(
                                      'Resend code',
                                      style: controller.counter > 3
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.blue,
                                              ),
                                    )
                                  : Text(
                                      'Resend code',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                            );
                          }),
                      SizedBox(width: MediaQuery.of(context).size.width / 6),
                      GetX<VerificationController>(
                        init: VerificationController(),
                        builder: (controller) => Text(
                          controller.time.value,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Login Button :
                MyElevetedButton(
                  onTap: () {
                    controller.onSave();
                  },
                  width: 3.6,
                  height: 35,
                  BackColor:
                      Theme.of(context).colorScheme.primary.withOpacity(.7),
                  label: 'confirm',
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 15,
                      ),
                      child: MyElevetedButton(
                        onTap: () {
                          Get.offAllNamed('EmailPageScreen');
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
