import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/add_quiz_controller.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/quiz_controller.dart';

class MultipleAnswersScreen extends StatelessWidget {
  final int numQuestions;

  const MultipleAnswersScreen({super.key, required this.numQuestions});

  @override
  Widget build(BuildContext context) {
    final AddQuizController addQuizController = Get.find();
    final QuizController quizController = Get.find();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      addQuizController.initializeAnswerFields(numQuestions);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Answers Questions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GetBuilder<AddQuizController>(
                builder: (controller) {
                  return Column(
                    children: List.generate(numQuestions, (i) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: controller.questionControllers[i],
                              decoration: const InputDecoration(
                                hintText: 'Question',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: List.generate(
                                  controller.answerFieldCounts[i], (j) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller:
                                            controller.answerControllers[i][j],
                                        decoration: InputDecoration(
                                          hintText: 'Enter answer ${j + 1}',
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      icon: Icon(
                                        controller.correctAnswers[i] == j
                                            ? Icons.check_circle
                                            : Icons.radio_button_unchecked,
                                        color: controller.correctAnswers[i] == j
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        controller.setCorrectAnswer(i, j);
                                      },
                                    ),
                                  ],
                                );
                              }),
                            ),
                            if (controller.answerFieldCounts[i] < 5)
                              ElevatedButton(
                                onPressed: () {
                                  controller.addAnswerField(i);
                                },
                                child: const Icon(Icons.add),
                              ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  var questions = List.generate(numQuestions, (i) {
                    return {
                      'question': addQuizController.questionControllers[i].text,
                      'answers': List.generate(
                          addQuizController.answerFieldCounts[i], (j) {
                        return addQuizController.answerControllers[i][j].text;
                      }),
                      'correctAnswer': addQuizController.correctAnswers[i],
                    };
                  });
                  quizController.addQuiz({
                    'subject': addQuizController.selectedSubject,
                    'type': 'multiple_answers',
                    'questions': questions,
                    'level': addQuizController.selectedLevel,
                  });
                  Get.back();
                  Get.back();
                  Get.snackbar(
                    'Success',
                    'Quiz published successfully',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
                child: const Text('Publish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
