import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/Dark_mode_Controller.dart';
import 'package:public_testing_app/src/controllers/My_Subjects_Controllers/OtherUsers_Subjects_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Home/fourth_Page/FilesTypes.dart';

class OtherUserSubjectsCard extends StatelessWidget {
  const OtherUserSubjectsCard({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    final OtherusersSubjectsController other_user_subjects_controller =
        Get.find();
    final width = Themes.getWidth(context);
    final height = Themes.getHeight(context);

    int year_id = other_user_subjects_controller
        .other_user_subjects_information[index]["year_id"];
    String year;
    String type = other_user_subjects_controller
        .other_user_subjects_information[index]["subject_type"];
    String name = other_user_subjects_controller
        .other_user_subjects_information[index]["name_subject"];
    int id = other_user_subjects_controller
        .other_user_subjects_information[index]["id"];
    if (year_id == 1) {
      year = "First Year";
    } else if (year_id == 2) {
      year = "Second Year";
    } else {
      year = "Third Year";
    }

    return GetBuilder<DarkModeController>(
      init: DarkModeController(),
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width - 30,
              height: Auth!.getString("user") == "active_doctor"
                  ? width - 250
                  : width - 280,
              decoration: BoxDecoration(
                border: DashedBorder.all(
                  dashLength: 50,
                  isOnlyCorner: true,
                  color: Themes.getColor(Themes.darkColorScheme.primary,
                      Themes.colorScheme.primary),
                  width: 3,
                ),
                color: Themes.getColor(
                    Themes.darkColorScheme.primaryContainer.withOpacity(.7),
                    Colors.blue.withOpacity(.5)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Text(
                      "name : $name",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  if (Auth!.getString("user") == "active_doctor")
                    Positioned(
                      top: 55,
                      left: 10,
                      child: Text(
                        "type : $type",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                  Positioned(
                    top: Auth!.getString("user") == "active_doctor" ? 90 : 55,
                    left: 10,
                    child: Text(
                      "year : $year",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Padding(
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
                            color: Themes.getColor(
                                Themes.darkColorScheme.primary, Colors.blue),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: width / 7 - 5,
                        height: height / 19,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => Filestypes(
                                subject_type: type,
                                subject_name: name,
                                year: year_id,
                                subject_id: id,
                              ),
                            );
                          },
                          child: const Icon(
                            Iconsax.arrow_right,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
