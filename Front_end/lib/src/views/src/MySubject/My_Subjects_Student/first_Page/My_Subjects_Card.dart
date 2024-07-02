import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/Dark_mode_Controller.dart';
import 'package:public_testing_app/src/controllers/My_Subjects_Controllers/Student_Subjects_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/MySubject/My_Subjects_Student/second_Page/My_Subject_Types.dart';

class MySubjectsCard extends StatelessWidget {
  const MySubjectsCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final student_subject_controller = Get.put(StudentSubjectsController());
    final width = Themes.getWidth(context);
    final height = Themes.getHeight(context);
    String year = '';
    if (student_subject_controller.year_id[index] == 1) {
      year = "first year";
    } else if (student_subject_controller.year_id[index] == 2) {
      year = "second year";
    } else if (student_subject_controller.year_id[index] == 3) {
      year = "third year";
    }

    return GetBuilder<DarkModeController>(
      init: DarkModeController(),
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      autoClose: true,
                      label: 'Delete Item',
                      spacing: 5,
                      onPressed: (ctx) {
                        student_subject_controller.remove_subject(
                          student_subject_controller.student_subjects[index],
                          context,
                          student_subject_controller.student_subjects,
                          student_subject_controller.Subjects_ids[index],
                        );
                      },
                      icon: Iconsax.trash,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor:
                          Theme.of(context).colorScheme.error.withOpacity(.7),
                    ),
                  ],
                ),
                child: Container(
                  width: width - 30,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: is_Dark!.getString('is_dark') == 'true'
                          ? Themes.darkColorScheme.primary
                          : Themes.colorScheme.primary,
                      width: 3,
                    ),
                    color: is_Dark!.getString('is_dark') == 'true'
                        ? Themes.darkColorScheme.primaryContainer
                            .withOpacity(.7)
                        : Colors.blue.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "${index + 1} . ${student_subject_controller.student_subjects[index]}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Text(
                            year,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 2,
                                offset: Offset(0, 0.5),
                              )
                            ],
                            color: Themes.colorScheme.onPrimaryContainer
                                .withOpacity(.8),
                            border: Border.all(
                              width: 2,
                              color: is_Dark!.getString('is_dark') == 'true'
                                  ? Themes.darkColorScheme.primary
                                  : Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: width / 7 - 5,
                          height: height / 19,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => MySubjectstypes(index: index));
                            },
                            child: const Icon(
                              Iconsax.arrow_right,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
