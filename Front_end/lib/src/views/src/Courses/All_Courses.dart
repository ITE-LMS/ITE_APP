// ignore_for_file: file_names
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/Courses_Controllers/Courses_Controller.dart';
import 'package:public_testing_app/src/models/SearchDelegate.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Courses/Course_page.dart';

// ignore: must_be_immutable
class AllCourses extends StatelessWidget {
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Themes.getWidth(context);
    final height = Themes.getHeight(context);

    final courses_controller = Get.put(CoursesController());
    return Column(
      children: [
        // search bar :
        Container(
          height: MediaQuery.of(context).size.height / 5,
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
            color: Themes.getColor(Themes.darkColorScheme.background,
                Themes.colorScheme.primaryContainer),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  'Hi , Programmer',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: MediaQuery.of(context).size.width / 15,
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                height: 55,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Themes.getColor(
                          Themes.darkColorScheme.primary,
                          Colors.blue,
                        ),
                        width: 4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        showSearch( 
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      decoration: InputDecoration(
                        fillColor: Themes.getColor(
                          Themes.darkColorScheme.background,
                          Colors.white,
                        ),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Search here ...',
                        hintStyle:
                            Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontSize: 20,
                                color: Themes.getColor(
                                  Colors.white,
                                  Colors.black.withOpacity(0.5),
                                )),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color: Themes.getColor(
                              Colors.white,
                              Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Courses :
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 40, bottom: 10),
                child: Text(
                  'Courses:',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListWheelScrollViewX.useDelegate(
                  renderChildrenOutsideViewport: false,
                  itemExtent: width - 60,
                  diameterRatio: 3,
                  scrollDirection: axisDirectionToAxis(AxisDirection.right),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: courses_controller.name.length,
                    builder: (context, index) {
                      log(index.toString());
                      log(courses_controller.path[index]);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          width: width,
                          height: width,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 2,
                              )
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            gradient: LinearGradient(
                              colors: is_Dark!.getString('is_dark') == 'true'
                                  ? [
                                      const Color(0xff83D5C1),
                                      const Color(0xff83D5C1).withGreen(200),
                                      const Color(0xff606871),
                                    ]
                                  : [
                                      const Color(0xff64ACFF),
                                      const Color(0xff85AAD5),
                                      const Color(0xff606871),
                                    ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: DashedBorder.all(
                              dashLength: 150,
                              color: courses_controller.colors[index],
                              isOnlyCorner: true,
                              strokeCap: StrokeCap.round,
                              strokeAlign: BorderSide.strokeAlignInside,
                              width: 6,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Course image :
                              Positioned(
                                top: 50,
                                left: 80,
                                child: Image(
                                  image: AssetImage(
                                    courses_controller.path[index],
                                  ),
                                  height: 170,
                                  width: 180,
                                ),
                              ),
                              // Course names :
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Text(
                                  '${courses_controller.name[index]} :',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PoetsenOne',
                                  ),
                                ),
                              ),
                              // number of videos :
                              Positioned(
                                top: 320,
                                left: 20,
                                child: Text(
                                  '${courses_controller.desc[index]}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PoetsenOne'),
                                ),
                              ),
                              // auther name :
                              Positioned(
                                left: 20,
                                top: 285,
                                child: Text(
                                  'auther:${courses_controller.auther[index]}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PoetsenOne'),
                                ),
                              ),
                              // arrow forward :
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    color: courses_controller.colors[index],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        Get.to(
                                          //! edtiting  :
                                          Course(
                                            index: index,
                                            name:
                                                courses_controller.name[index],
                                            desc:
                                                courses_controller.desc[index],
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
