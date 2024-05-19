// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, unused_field
//import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/src/widgets/ElevatedButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/main.dart';

class DrawersController extends GetxController {
  File? image;

  Future PickImageFromGallery(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: is_Dark!.getString('is_dark') == 'true'
          ? Themes.darkColorScheme.secondaryContainer
          : Themes.colorScheme.primaryContainer,
      context: context,
      builder: (ctx) => BottomSheet(),
    );
  }

  void selectImage(ImageSource source) async {
    var img = await ImagePicker().pickImage(source: source);
    if (img != null) {
      image = File(img.path);
      appData!.setString('image', image!.path);
      update(['image']);
    }
  }

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
                  BackColor: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.onPrimaryContainer
                      : Themes.colorScheme.onSecondaryContainer,
                  widget: Row(
                    children: [
                      Text(
                        'camera',
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Iconsax.camera,
                        color: is_Dark!.getString('is_dark') == 'true'
                            ? Colors.black
                            : Colors.white,
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
                  BackColor: is_Dark!.getString('is_dark') == 'true'
                      ? Themes.darkColorScheme.onPrimaryContainer
                      : Themes.colorScheme.onSecondaryContainer,
                  widget: Row(
                    children: [
                      Text(
                        'gallery',
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Iconsax.image,
                        color: is_Dark!.getString('is_dark') == 'true'
                            ? Colors.black
                            : Colors.white,
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
  void onInit() {
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
    super.onInit();
  }
}
