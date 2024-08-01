import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/quiz_controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Quizes/Student_Quizzes/quiz_solving_screen.dart';

import 'quiz_result_screen.dart';

class QuizStudentScreen extends StatelessWidget {
  const QuizStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: ListView.builder(
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
                                  strokeAlign: BorderSide.strokeAlignInside,
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
                                    right: 10,
                                    child: CircleAvatar(
                                      radius: 21,
                                      backgroundColor:
                                          controller.completed_quizzes[index]
                                              ? Colors.green
                                              : Colors.red,
                                      child: CircleAvatar(
                                        radius: 20,
                                        child: Center(
                                          child: controller
                                                  .completed_quizzes[index]
                                              ? const Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                )
                                              : const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                      onTap: () {
                                        if (controller
                                                .completed_quizzes[index] ==
                                            true) {
                                          Get.to(
                                            () => QuizResultScreen(
                                              studentAnswers:
                                                  controller.selected_answers,
                                              quiz: quiz,
                                            ),
                                          );
                                        } else {
                                          Get.to(
                                            () => QuizStudentDetailScreen(
                                              quiz: quiz,
                                              quizIndex: index,
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: width / 3.8,
                                        height: width / 8,
                                        decoration: BoxDecoration(
                                          color: Themes
                                              .colorScheme.onPrimaryContainer,
                                          border: Border.all(
                                            width: 3,
                                            color: Themes.getColor(
                                                Colors.white, Colors.white),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Themes.getColor(
                                                  Colors.green, Colors.blue),
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
                                              controller
                                                      .completed_quizzes[index]
                                                  ? 'Open'
                                                  : 'Solve',
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
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
