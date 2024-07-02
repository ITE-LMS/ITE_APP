// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, unused_field

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/src/widgets/ElevatedButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';
import 'package:http/http.dart' as http;
import '../../models/SnackBar.dart';

class DrawersController extends GetxController {
  File? image;
  final Form_key = GlobalKey<FormState>();
  Widget? circleImage;
  // Called when the user click SAVE for saving changes if its found :
  void SavePhoto() {
    if (Form_key.currentState!.validate()) {
      Form_key.currentState!.save();
      circleImage = const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );
      update(['circle_image']);

      if (Auth!.getString('user') == "active_student") {
        _uploadStudentImage();
      } else if (Auth!.getString('user') == "active_doctor") {
        _uploadDoctorImage();
      } else if (Auth!.getString('user') == "active_teacher") {
        _uploadTeacherImage();
      }
    } else {
      return;
    }
  }

  // function called when the student Change his picture and save changes :
  Future<void> _uploadStudentImage() async {
    try {
      if (appData!.getString('user_photo_localy') == '') {
        circleImage = null;
        update(['circle_image']);
        Get.back();
        return;
      }
      const String apiUrl = 'http://10.0.2.2:8000/api/Edit-student-photo';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('photo', image!.path),
      );

      //? You might need to include an Authorization header with the student's token
      request.headers['Authorization'] = "Bearer ${Auth!.getString('token')}";

      var response = await request.send();

      if (response.statusCode == 200) {
        //? Photo updated successfully
        circleImage = null;
        update(['circle_image']);
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
              'Changes Saved',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      } else {
        //? Handle error (e.g., display an error message to the user)
        snackBar sb = snackBar(
          path: 'assets/images/cross.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'went wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Something',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // function called when the Doctor Change his picture and save changes :
  Future<void> _uploadDoctorImage() async {
    try {
      if (appData!.getString('user_photo_localy') == '') {
        circleImage = null;
        update(['circle_image']);
        Get.back();
        return;
      }
      const String apiUrl = 'http://10.0.2.2:8000/api/Edit-doctor-photo';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('photo', image!.path),
      );

      //? You might need to include an Authorization header with the student's token
      request.headers['Authorization'] = "Bearer ${Auth!.getString('token')}";

      var response = await request.send();

      if (response.statusCode == 200) {
        //? Photo updated successfully
        circleImage = null;
        update(['circle_image']);
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
              'Changes Saved',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      } else {
        //? Handle error (e.g., display an error message to the user)
        snackBar sb = snackBar(
          path: 'assets/images/cross.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'went wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Something',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // function called when the Teacher Change his picture and save changes :
  Future<void> _uploadTeacherImage() async {
    try {
      if (appData!.getString('user_photo_localy') == '') {
        circleImage = null;
        update(['circle_image']);
        Get.back();
        return;
      }
      const String apiUrl = 'http://10.0.2.2:8000/api/Edit-teacher-photo';

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        await http.MultipartFile.fromPath('photo', image!.path),
      );

      //? You might need to include an Authorization header with the student's token
      request.headers['Authorization'] = "Bearer ${Auth!.getString('token')}";

      var response = await request.send();

      if (response.statusCode == 200) {
        //? Photo updated successfully
        circleImage = null;
        update(['circle_image']);
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
              'Changes Saved',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      } else {
        //? Handle error (e.g., display an error message to the user)
        snackBar sb = snackBar(
          path: 'assets/images/cross.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'went wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Something',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Viewing Bottom Sheet :
  Future PickImageFromSource(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: Themes.getColor(
          Themes.darkColorScheme.secondaryContainer,
          Themes.colorScheme.primaryContainer),
      context: context,
      builder: (ctx) => BottomSheet(),
    );
  }

  // function for selecting image from the user device depending on speciefic source :
  void selectImage(ImageSource source) async {
    var img = await ImagePicker().pickImage(source: source);
    if (img != null) {
      image = File(img.path);
      appData!.setString('user_photo_localy', image!.path);
      update(['image']);
    }
  }

  // bottom Sheet to choose image source : (Gallery || Camera):
  Widget BottomSheet() {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              indent: Get.mediaQuery.size.width / 2.5,
              endIndent: Get.mediaQuery.size.width / 2.5,
              thickness: 2,
            ),
          ),
          Text(
            'Choose Your Profile Photo',
            style: Get.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyElevetedButton(
                  onTap: () => selectImage(ImageSource.camera),
                  width: 10,
                  height: 20,
                  BackColor: Themes.getColor(
                      Themes.darkColorScheme.onPrimaryContainer,
                      Themes.colorScheme.onSecondaryContainer),
                  widget: Row(
                    children: [
                      Text(
                        'camera',
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Themes.getColor(Colors.black, Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Iconsax.camera,
                        color: Themes.getColor(Colors.black, Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyElevetedButton(
                  onTap: () => selectImage(ImageSource.gallery),
                  width: 10,
                  height: 20,
                  BackColor: Themes.getColor(
                      Themes.darkColorScheme.onPrimaryContainer,
                      Themes.colorScheme.onSecondaryContainer),
                  widget: Row(
                    children: [
                      Text(
                        'gallery',
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Themes.getColor(Colors.black, Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Iconsax.image,
                        color: Themes.getColor(Colors.black, Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onInit() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Themes.getColor(
            Themes.darkColorScheme.primary, Themes.colorScheme.primary),
        systemNavigationBarColor: Themes.getColor(
            Themes.darkColorScheme.primary, Themes.colorScheme.primary),
      ),
    );
    appData!.setString('user_photo_localy', '');
    super.onInit();
  }

  // FETCH student picture :
  void getStudentPhoto() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/get-student-photo');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      ).timeout(const Duration(seconds: 30));
      final decodedResponse = json.decode(response.body);

      if (decodedResponse["data"] != null) {
        String updatedUrl =
            decodedResponse["data"].replaceFirst("127.0.0.1", "10.0.2.2");
        log(updatedUrl);
        appData!.setString('user_photo', updatedUrl);
      } else {
        appData!.setString('user_photo', '');
      }
      update(['user_picture']);
    } catch (e) {
      log(e.toString());
    }
  }

  // FETCH doctor picture :
  void getDoctorPhoto() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/get-doctor-photo');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      ).timeout(const Duration(seconds: 30));
      final decodedResponse = json.decode(response.body);

      if (decodedResponse["data"] != null) {
        String updatedUrl =
            decodedResponse["data"].replaceFirst("127.0.0.1", "10.0.2.2");
        log(updatedUrl);
        appData!.setString('user_photo', updatedUrl);
      } else {
        appData!.setString('user_photo', '');
      }
      update(['user_picture']);
    } catch (e) {
      log(e.toString());
    }
  }

  // FETCH teacher picture :
  void getTeacherPhoto() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/get-teacher-photo');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      ).timeout(const Duration(seconds: 30));
      final decodedResponse = json.decode(response.body);

      if (decodedResponse["data"] != null) {
        String updatedUrl =
            decodedResponse["data"].replaceFirst("127.0.0.1", "10.0.2.2");
        log(updatedUrl);
        appData!.setString('user_photo', updatedUrl);
      } else {
        appData!.setString('user_photo', '');
      }
      update(['user_picture']);
    } catch (e) {
      log(e.toString());
    }
  }
}
