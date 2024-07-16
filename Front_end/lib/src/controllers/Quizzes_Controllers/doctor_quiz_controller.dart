import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorQuizController extends GetxController {
  List<Map<String, dynamic>> quizzes = [];

  // إضافة اختبار جديد إلى القائمة
  void addQuiz(Map<String, dynamic> quiz) {
    quizzes.add(quiz);
    update();
  }

  // حذف اختبار من القائمة بواسطة الفهرس
  void deleteQuiz(int index, BuildContext context) {
    final temp = quizzes[index];

    quizzes.removeAt(index);
    update();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Quiz Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            quizzes.insert(index, temp);
            update();
            return;
          },
        ),
      ),
    );
  }


}
