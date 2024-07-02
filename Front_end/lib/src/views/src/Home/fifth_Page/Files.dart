import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/Home_Controllers/Home_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:public_testing_app/src/views/src/Home/fourth_Page/FilesTypes.dart';

class Files extends StatelessWidget {
  Files({
    super.key,
    required this.subject_type,
    required this.subject_name,
    required this.year,
    required this.type,
  });

  String subject_type;
  final String subject_name;
  final int year;
  final Files_Types type;

  @override
  Widget build(BuildContext context) {
    subject_type = subject_type.substring(
      0,
      subject_type.length - 2,
    );

    final width = Themes.getWidth(context);
    final height = Themes.getHeight(context);
    final Home_Controller = Get.put(HomeController());
    int index = -1;

    return Scaffold(
      backgroundColor: is_Dark!.getString('is_dark') == 'true'
          ? Themes.darkColorScheme.background.withOpacity(.9)
          : Colors.white,
      appBar: AppBar(
        backgroundColor: is_Dark!.getString('is_dark') == 'true'
            ? Themes.darkColorScheme.background
            : Themes.colorScheme.primaryContainer,
        title: year == 1
            ? MarqueeText(
                alwaysScroll: true,
                speed: 20,
                text: TextSpan(
                    text:
                        '1. ${Home_Controller.years[0]} / $subject_name / $subject_type / ${type.name} :'),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: width / 20,
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Themes.darkColorScheme.primary
                        : Themes.colorScheme.primary),
              )
            : year == 2
                ? MarqueeText(
                    alwaysScroll: true,
                    speed: 15,
                    text: TextSpan(
                      text:
                          '2. ${Home_Controller.years[1]} / $subject_name / $subject_type / ${type.name} :',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: width / 20,
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Themes.darkColorScheme.primary
                              : Themes.colorScheme.primary),
                    ),
                  )
                : MarqueeText(
                    alwaysScroll: true,
                    speed: 15,
                    text: TextSpan(
                      text:
                          '3. ${Home_Controller.years[2]} / $subject_name / $subject_type / ${type.name} :',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: width / 20,
                          color: is_Dark!.getString('is_dark') == 'true'
                              ? Themes.darkColorScheme.primary
                              : Themes.colorScheme.primary),
                    ),
                  ),
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: width / 7,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: is_Dark!.getString('is_dark') == 'true'
                      ? Colors.green.withGreen(255)
                      : Colors.blue.withBlue(255),
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 1),
                  blurRadius: 7,
                )
              ],
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Themes.darkColorScheme.background
                  : Themes.colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                '${type.name} :',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: width / 15,
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Themes.darkColorScheme.primary
                        : Themes.colorScheme.primary),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
