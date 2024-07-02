import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/views/src/Quizes/Doctor_Quizzes/add_quiz_screens/multiple_answers_screen.dart';
import 'package:public_testing_app/src/views/src/Quizes/Doctor_Quizzes/add_quiz_screens/quiz_true_or_false_screen.dart';

class AddQuizController extends GetxController {
  final form_key = GlobalKey<FormState>();
  final List<String> subjects = ['Math', 'Science', 'History', 'Algorithm_2'];
  final List<String> levels = ['Easy', 'Medium', 'Hard'];
  String selectedSubject = 'Math';
  String selectedQuestionType = 'true_or_false';
  String selectedLevel = 'Easy';
  int numQuestions = 3;

  List<TextEditingController> questionControllers = [];
  List<List<TextEditingController>> answerControllers = [];
  List<String?> answers = [];
  List<int> answerFieldCounts = [];
  List<int> correctAnswers = [];

  AddQuizController() {
    initializeControllers(numQuestions);
  }

  void onSave() {
    if(form_key.currentState!.validate()){
      
      if (selectedQuestionType == 'true_or_false') {
      Get.to(
        () => QuizTrueOrFalseScreen(numQuestions: numQuestions),
      );
    } else if (selectedQuestionType == 'multiple_answers') {
      Get.to(
        () => MultipleAnswersScreen(numQuestions: numQuestions),
      );
    }}
  }

  // تهيئة وحدات التحكم للأسئلة والإجابات
  void initializeControllers(int num) {
    questionControllers = List.generate(num, (_) => TextEditingController());
    answerControllers = List.generate(num, (_) => [TextEditingController()]);
    answers = List<String?>.filled(num, null, growable: true);
    answerFieldCounts = List<int>.filled(num, 1, growable: true);
    correctAnswers = List<int>.filled(num, -1, growable: true);
  }

  // تعيين الموضوع المحدد للاختبار
  void setSelectedSubject(String subject) {
    selectedSubject = subject;
    update();
  }

  // تعيين نوع السؤال المحدد للاختبار
  void setSelectedQuestionType(String type) {
    selectedQuestionType = type;
    update();
  }

  // تعيين مستوى الصعوبة المحدد للاختبار
  void setSelectedLevel(String level) {
    selectedLevel = level;
    update();
  }

  // تعيين عدد الأسئلة للاختبار
  void setNumQuestions(int num) {
    numQuestions = num;
    initializeControllers(num);
    update();
  }

  // تعيين الإجابة لسؤال معين
  void setAnswer(int index, String answer) {
    answers[index] = answer;
    update();
  }

  // تهيئة حقول الإجابات للأسئلة متعددة الخيارات
  void initializeAnswerFields(int numQuestions) {
    answerFieldCounts = List<int>.generate(numQuestions, (index) => 1);
    correctAnswers = List<int>.generate(numQuestions, (index) => -1);
    update();
  }

  // إضافة حقل إجابة إضافي لسؤال معين
  void addAnswerField(int index) {
    if (answerFieldCounts[index] < 5) {
      answerFieldCounts[index]++;
      answerControllers[index].add(TextEditingController());
      update();
    }
  }

  // تعيين الإجابة الصحيحة لسؤال معين
  void setCorrectAnswer(int questionIndex, int answerIndex) {
    correctAnswers[questionIndex] = answerIndex;
    update();
  }
}
