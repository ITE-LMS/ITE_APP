import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/add_quiz_controller.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/doctor_quiz_controller.dart';
import 'package:public_testing_app/src/models/Themes.dart';

class QuizTrueOrFalseScreen extends StatelessWidget {
  final int numQuestions;

  const QuizTrueOrFalseScreen({super.key, required this.numQuestions});

  @override
  Widget build(BuildContext context) {
    final AddQuizController addQuizController = Get.find();
    final DoctorQuizController quizController = Get.find();
    final width = Themes.getWidth(context);
    final hieght = Themes.getHeight(context);

    return Scaffold(
      backgroundColor: Themes.getColor(
          Themes.darkColorScheme.background.withOpacity(.9), Colors.white),
      appBar: AppBar(
        title: const Text('True OR False Quiz :'),
        backgroundColor: Themes.getColor(Themes.darkColorScheme.background,
            Themes.colorScheme.primaryContainer),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Complete This Form :',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 5),
                        child: InkWell(
                          onTap: () {
                            addQuizController
                                .publishQuiz_TrueORFalse(numQuestions);
                          },
                          child: Container(
                            width: width / 2.8,
                            height: width / 6.7,
                            decoration: BoxDecoration(
                              color: Themes.colorScheme.onPrimaryContainer,
                              border: Border.all(
                                width: 3,
                                color:
                                    Themes.getColor(Colors.white, Colors.white),
                              ),
                              borderRadius: BorderRadius.circular(15),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Publish',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  size: 35,
                                  Iconsax.arrow_up_1,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: numQuestions,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Themes.getColor(
                          Themes.darkColorScheme.onPrimary.withOpacity(.3),
                          Themes.colorScheme.primaryContainer,
                        ),
                        border: Border.all(
                          color: Themes.getColor(
                            Themes.darkColorScheme.primary,
                            Themes.colorScheme.primary,
                          ),
                          width: 5,
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: Themes.getColor(
                                  Colors.white,
                                  Colors.blue,
                                ),
                              ),
                            ),
                            child: Form(
                              key: addQuizController
                                  .form_key_for_true_or_false[index],
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Question";
                                  }
                                  if (int.tryParse(value) != null ||
                                      double.tryParse(value) != null) {
                                    return "Enter a valid Question";
                                  }
                                },
                                onSaved: (newValue) {
                                  addQuizController.questionControllers[index]
                                      .text = newValue!;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Question',
                                  hintStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          GetBuilder<AddQuizController>(
                            init: AddQuizController(),
                            builder: (controller) {
                              return Column(
                                children: [
                                  RadioListTile<String>(
                                    title: const Text('True'),
                                    value: 'true',
                                    groupValue: controller.answers[index],
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        controller.setAnswer(index, value);
                                      }
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: const Text('False'),
                                    value: 'false',
                                    groupValue: controller.answers[index],
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        controller.setAnswer(index, value);
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
