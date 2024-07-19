
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Quizzes_Controllers/doctor_quiz_controller.dart';
import 'package:public_testing_app/src/models/SnackBar.dart';
import 'package:public_testing_app/src/views/src/Quizes/Doctor_Quizzes/add_quiz_screens/multiple_answers_screen.dart';
import 'package:public_testing_app/src/views/src/Quizes/Doctor_Quizzes/add_quiz_screens/quiz_true_or_false_screen.dart';

class AddQuizController extends GetxController {
  final DoctorQuizController quizController = Get.find();
  final form_key = GlobalKey<FormState>();
  List<GlobalKey<FormState>> form_key_for_true_or_false = [];
  List<GlobalKey<FormState>> form_key_for_multible_question = [];
  List<List<GlobalKey<FormState>>> form_key_for_multible_answers = [];

  final List<String> subjects = ['Math', 'Science', 'History', 'Algorithm_2'];
  final List<String> levels = ['Easy', 'Medium', 'Hard'];
  String selectedSubject = 'Math';
  String selectedQuestionType = 'true_or_false';
  String selectedLevel = 'Easy';
  int numQuestion = 3;

  List<TextEditingController> questionControllers = [];
  List<List<TextEditingController>> answerControllers = [];
  List<String?> answers = [];
  List<int> answerFieldCounts = [];
  List<int> correctAnswers = [];

  void onSave() {
    if (form_key.currentState!.validate()) {
      form_key.currentState!.save();
      if (selectedQuestionType == 'true_or_false') {
        Get.to(
          () => QuizTrueOrFalseScreen(numQuestions: numQuestion),
        );
      } else if (selectedQuestionType == 'multiple_answers') {
        Get.to(
          () => MultipleAnswersScreen(numQuestions: numQuestion),
        );
      }
    }
  }

  // تهيئة وحدات التحكم للأسئلة والإجابات
  @override
  void onInit() {
    init_num_question();
    super.onInit();
  }

  void init_num_question() {
    numQuestion = numQuestion;
    questionControllers =
        List.generate(numQuestion, (_) => TextEditingController());
    form_key_for_true_or_false =
        List.generate(numQuestion, (_) => GlobalKey<FormState>());
    form_key_for_multible_question =
        List.generate(numQuestion, (_) => GlobalKey<FormState>());
    form_key_for_multible_answers = List.generate(
        numQuestion, (_) => List.generate(1, (_) => GlobalKey<FormState>()));
    answerControllers =
        List.generate(numQuestion, (_) => [TextEditingController()]);
    answers = List<String?>.filled(numQuestion, null, growable: true);
    answerFieldCounts = List<int>.filled(numQuestion, 1, growable: true);
    correctAnswers = List<int>.filled(numQuestion, -1, growable: true);
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
    numQuestion = num;
    update();
  }

  // تعيين الإجابة لسؤال معين
  void setAnswer(int index, String answer) {
    answers[index] = answer;
    update();
  }

  // تهيئة حقول الإجابات للأسئلة متعددة الخيارات
  void initializeAnswerFields(int numQuestions) {
    numQuestion = numQuestions;

    //answerFieldCounts = List<int>.generate(numQuestions, (index) => 1);
    //correctAnswers = List<int>.generate(numQuestions, (index) => -1);
    update(['update_num_question']);
  }

  // إضافة حقل إجابة إضافي لسؤال معين
  void addAnswerField(int index) {
    if (answerFieldCounts[index] < 5) {
      answerFieldCounts[index]++;
      answerControllers[index].add(TextEditingController());
      form_key_for_multible_answers[index].add(GlobalKey<FormState>());
      update(['quiz']);
    }
  }

  void removeAnswerField(int index) {
    if (answerFieldCounts[index] > 1) {
      answerFieldCounts[index]--;
      answerControllers[index].remove(TextEditingController());
      form_key_for_multible_answers[index].remove(GlobalKey<FormState>());
      update(['quiz']);
    }
  }

  // تعيين الإجابة الصحيحة لسؤال معين
  void setCorrectAnswer(int questionIndex, int answerIndex) {
    correctAnswers[questionIndex] = answerIndex;
    update(['quiz']);
  }

  void publishQuiz_TrueORFalse(int numQuestions) {
    for (int index = 0; index < numQuestions; index++) {
      if (form_key_for_true_or_false[index].currentState!.validate()) {
        form_key_for_true_or_false[index].currentState!.save();
      } else {
        return;
      }
    }
    var questions = List.generate(numQuestions, (i) {
      return {
        'question': questionControllers[i].text,
        'answers': ['True', 'False'],
        'correctAnswer': answers[i] == 'true' ? 0 : 1,
      };
    });
    quizController.addQuiz({
      'subject': selectedSubject,
      'type': 'true_or_false',
      'questions': questions,
      'level': selectedLevel,
    });
    Get.back();
    Get.back();
    snackBar sb = snackBar(
      BorderColor: Colors.green,
      path: 'assets/images/check.png',
      title: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'Quiz Published',
          style: Get.textTheme.titleLarge!.copyWith(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      message: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'Successfully',
          style: Get.textTheme.titleLarge!.copyWith(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
    sb.snackbar();
    questionControllers =
        List.generate(numQuestions, (_) => TextEditingController());
    answers = List<String?>.filled(numQuestions, null, growable: true);
  }

  void publishQuiz_MultiAnswers(int numQuestions) {
    for (int index = 0; index < numQuestions; index++) {
      if (form_key_for_multible_question[index].currentState!.validate()) {
        form_key_for_multible_question[index].currentState!.save();
        for (int j = 0; j < answerFieldCounts[index]; j++) {
          if (form_key_for_multible_answers[index][j]
              .currentState!
              .validate()) {
            form_key_for_multible_answers[index][j].currentState!.save();
          } else {
            return;
          }
        }
      } else {
        return;
      }
    }
    var questions = List.generate(numQuestions, (i) {
      return {
        'question': questionControllers[i].text,
        'answers': List.generate(answerFieldCounts[i], (j) {
          return answerControllers[i][j].text;
        }),
        'correctAnswer': correctAnswers[i],
      };
    });
    quizController.addQuiz({
      'subject': selectedSubject,
      'type': 'multiple_answers',
      'questions': questions,
      'level': selectedLevel,
    });
    Get.back();
    Get.back();
    snackBar sb = snackBar(
      BorderColor: Colors.green,
      path: 'assets/images/check.png',
      title: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'Quiz Published',
          style: Get.textTheme.titleLarge!.copyWith(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      message: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'Successfully',
          style: Get.textTheme.titleLarge!.copyWith(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
    sb.snackbar();
    questionControllers =
        List.generate(numQuestions, (_) => TextEditingController());
    answers = List<String?>.filled(numQuestions, null, growable: true);
  }
}
