// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Courses_Controllers/Courses_Controller.dart';

// ignore: must_be_immutable
class VideoSection extends StatelessWidget {
  VideoSection({
    super.key,
  });
  List<bool> isVid = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final CoursesController extcontroller = Get.put(CoursesController());
  List videos = [
    'introducton to flutter',
    'basics in flutter',
    'widgets in flutter',
    'state less  widget',
    'state full widget',
    'layout in flutter',
    'design in flutter',
    'animations in flutter',
    'navigation in flutter',
  ];
  List subtitle = [
    '22 min 50 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
    '12 min 30 sec',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: GetBuilder<CoursesController>(
            builder: (controller) {
              return InkWell(
                onTap: () {
                  isVid[index] = true;
                  controller.ChangColor();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: isVid[index]
                          ? const Color(0xff674AEF)
                          : const Color(0xff674AEF).withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
          title: Text('${videos[index]}'),
          subtitle: Text('${subtitle[index]}'),
        );
      },
    );
  }
}
