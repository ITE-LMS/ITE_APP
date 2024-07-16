import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/controllers/Courses_Controllers/Courses_Controller.dart';
import 'package:public_testing_app/src/controllers/Dark_mode_Controller.dart';
import 'package:public_testing_app/src/controllers/Home_Page_Controllers/Drawer_Controller.dart';
import 'package:public_testing_app/src/controllers/My_Subjects_Controllers/Student_Subjects_Controller.dart';
import 'package:public_testing_app/src/controllers/Personal_Assistant_AI_Controller/AI_controller.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/add_quiz_controller.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/doctor_quiz_controller.dart';

// Binding class for dependency injection
class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(DarkModeController());
    Get.put(DrawersController());
    Get.put(AIController());
    if (Auth!.getString('user') == 'active_student') Get.put(CoursesController());
    if (Auth!.getString('user') == 'active_teacher' || Auth!.getString('user') == 'active_doctor') Get.put(DoctorQuizController());
    if (Auth!.getString('user') == 'active_teacher' || Auth!.getString('user') == 'active_doctor') Get.put(AddQuizController());
    if (Auth!.getString('user') == 'active_student') Get.put(StudentSubjectsController());
  }
}