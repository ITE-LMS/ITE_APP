import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/Home_Controllers/Home_Controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'FilesTypes.dart';

class FilestypesCard extends StatelessWidget {
  const FilestypesCard(
      {super.key,
      required this.type,
      required this.index,
      required this.subject_type,
      required this.subject_name,
      required this.year});

  final Files_Types type;
  final int index;
  final String subject_type;
  final String subject_name;
  final int year;

  @override
  Widget build(BuildContext context) {
    final Home_Controller = Get.put(HomeController());
    final width = Themes.getWidth(context);
    final height = Themes.getHeight(context);

    final go_to_file_screen = InkWell(
      onTap: () {
        Home_Controller.get_files_for_type(
            type, subject_type, subject_name, year);
      },
      child: const Icon(
        size: 30,
        Iconsax.arrow_right,
        color: Colors.white,
      ),
    );

    return Stack(
      children: [
        // Files Types Cards :
        Container(
          decoration: BoxDecoration(
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
              color: is_Dark!.getString('is_dark') == 'true'
                  ? Colors.green
                  : Colors.blue,
              dashLength: 70,
              width: 4,
              isOnlyCorner: true,
              strokeAlign: BorderSide.strokeAlignInside,
              strokeCap: StrokeCap.round,
            ),
            color: Colors.white, // Example color
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        // Files Types Images :
        Positioned(
          left: 15,
          top: 50,
          child: Image(
            image: AssetImage(Home_Controller.files_types_photos[index]),
            width: 70,
            height: 70,
            color: index == 0
                ? is_Dark!.getString('is_dark') == 'true'
                    ? Colors.blue
                    : Colors.green
                : null,
          ),
        ),
        // Files Types names :
        Positioned(
          top: 10,
          left: 20,
          child: Text(
            '${Home_Controller.files_types_names[index]} :',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        // Files Types Button Navigate to Files Screen :
        Positioned(
          left: 110,
          top: 120,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 2,
                  offset: Offset(0, 0.5),
                )
              ],
              color: Themes.colorScheme.onPrimaryContainer.withOpacity(.8),
              border: Border.all(
                width: 2,
                color: is_Dark!.getString('is_dark') == 'true'
                    ? Themes.darkColorScheme.primary
                    : Colors.blue,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            width: width / 8,
            height: height / 19,
            //! update every subject :
            child: go_to_file_screen,
          ),
        ),
      ],
    );
  }
}
