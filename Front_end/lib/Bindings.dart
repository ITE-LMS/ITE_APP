import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Courses_Controllers/Courses_Controller.dart';
import 'package:public_testing_app/src/controllers/Dark_mode_Controller.dart';
import 'package:public_testing_app/src/controllers/Personal_Assistant_AI_Controller/AI_controller.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/add_quiz_controller.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/quiz_controller.dart';

// Binding class for dependency injection
class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(DarkModeController());
    Get.put(AIController());
    Get.put(CoursesController());
    Get.put(AddQuizController());
    Get.put(QuizController());
  }
}
