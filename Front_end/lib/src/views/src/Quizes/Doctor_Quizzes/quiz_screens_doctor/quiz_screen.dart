import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/quiz_controller.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Quizes/Doctor_Quizzes/add_quiz_screens/add_quiz_screen.dart';
import 'package:public_testing_app/src/views/src/Quizes/Doctor_Quizzes/quiz_screens_doctor/quiz_screen_details.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final content = Container(
      width: width / 2.8,
      height: width / 7.5,
      decoration: BoxDecoration(
        color: Themes.colorScheme.onPrimaryContainer,
        border: Border.all(
          width: 3,
          color: Themes.getColor(Colors.white, Colors.white),
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Themes.getColor(Colors.green, Colors.blue),
            blurStyle: BlurStyle.outer,
            blurRadius: 5,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'add quiz',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => Get.to(() => const AddQuizScreen()),
            child: const Icon(
              size: 35,
              Iconsax.add_square,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (controller) {
        return Stack(
          children: [
            Positioned(
              top: 20,
              left: 10,
              child: Text(
                'Quizzes :',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 30,
                    ),
              ),
            ),
            Center(
              child: controller.quizzes.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Image(
                          image: AssetImage('assets/images/quiz_not_found.png'),
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'No Quizzes Added Yet',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20,
                                  ),
                        ),
                        Text(
                          'Add One!',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20,
                                    color: Colors.redAccent,
                                  ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: GetBuilder<QuizController>(
                          id: 'quizzes',
                          builder: (controller_quiz) {
                            return ListView.builder(
                              itemCount: controller.quizzes.length,
                              itemBuilder: (context, index) {
                                var quiz = controller.quizzes[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 250,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: DashedBorder.all(
                                        color: Themes.getColor(
                                            Colors.green, Colors.blue),
                                        dashLength: 120,
                                        width: 5,
                                        isOnlyCorner: true,
                                        strokeAlign:
                                            BorderSide.strokeAlignInside,
                                        strokeCap: StrokeCap.round,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: Themes.isDarkMode()
                                            ? [
                                                const Color(0xff606871),
                                                const Color(0xff83D5C1)
                                                    .withGreen(200),
                                                const Color(0xff83D5C1),
                                              ]
                                            : [
                                                const Color(0xff64ACFF),
                                                const Color(0xff85AAD5),
                                                const Color(0xff606871),
                                              ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 10,
                                          child: Text(
                                            'Subject: ${quiz['subject']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                        Positioned(
                                          top: 40,
                                          child: Text(
                                            'Quiz Type: ${quiz['type']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                        Positioned(
                                          top: 70,
                                          child: Text(
                                            'Questions: ${quiz['questions'].length}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                        Positioned(
                                          top: 100,
                                          child: Text(
                                            'Level: ${quiz['level']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                        Positioned(
                                          top: 130,
                                          child: Text(
                                            'Time : ${quiz['time']} min',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: InkWell(
                                            onTap: () => Get.to(
                                              () =>
                                                  QuizDetailScreen(quiz: quiz),
                                            ),
                                            child: Container(
                                              width: width / 3.8,
                                              height: width / 8,
                                              decoration: BoxDecoration(
                                                color: Themes.colorScheme
                                                    .onPrimaryContainer,
                                                border: Border.all(
                                                  width: 3,
                                                  color: Themes.getColor(
                                                      Colors.white,
                                                      Colors.white),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Themes.getColor(
                                                        Colors.green,
                                                        Colors.blue),
                                                    blurStyle: BlurStyle.outer,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 1),
                                                  )
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Open',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  const Icon(
                                                    size: 25,
                                                    Iconsax.arrow_right,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Positioned(
                                          bottom: 5,
                                          right: 120,
                                          child: InkWell(
                                            onTap: () {
                                              int id = controller
                                                  .quizzes_ids[index];
                                              controller.remove_quiz(
                                                  context, id);
                                              controller.update_timer(
                                                  id, index);
                                            },
                                            child: Container(
                                              width: width / 3.8,
                                              height: width / 8,
                                              decoration: BoxDecoration(
                                                color: Themes.colorScheme
                                                    .onPrimaryContainer,
                                                border: Border.all(
                                                  width: 3,
                                                  color: Themes.getColor(
                                                      Colors.white,
                                                      Colors.white),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Themes.getColor(
                                                        Colors.green,
                                                        Colors.blue),
                                                    blurStyle: BlurStyle.outer,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 1),
                                                  )
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Delete',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  const Icon(
                                                    size: 25,
                                                    Iconsax.trash,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
            ),
            Positioned(
              right: 20,
              top: 15,
              child: content,
            ),
          ],
        );
      },
    );
  }
}
