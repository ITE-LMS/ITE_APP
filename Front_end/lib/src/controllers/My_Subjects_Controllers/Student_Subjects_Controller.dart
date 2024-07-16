// ignore_for_file: await_only_futures, unused_field

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/models/SnackBar.dart';
import 'package:http/http.dart' as http;

class StudentSubjectsController extends GetxController {
  List<String> student_subjects = [];
  List<int> Subjects_ids = [];
  List<String> years_of_subjects = [];
  List<int> year_id = [1, 2, 3];

  late Timer _timer;
  RxInt start_timer = 4.obs;

  void remove_subject(
      String subject_name, BuildContext context, int subject_id) async {
    final index = student_subjects.indexOf(subject_name);

    student_subjects.remove(subject_name);
    update(['subjects']);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: GetX<StudentSubjectsController>(
          builder: (controller) {
            return Row(
              children: [
                const Text('subject Deleted'),
                const SizedBox(width: 20),
                Text('$start_timer'),
              ],
            );
          },
        ),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            _timer.cancel();
            start_timer = 4.obs;
            student_subjects.insert(index, subject_name);
            update(['subjects']);
            return;
          },
        ),
      ),
    );
    // sending http request to server to remove the subject :
  }

  void update_timer(int subject_id) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (start_timer == 0.obs) {
          removeFromMySubjects(subject_id);
          start_timer = 4.obs;
          timer.cancel();
        } else {
          start_timer--;
        }
      },
    );
  }

  // this function for removing the subjects choosed from student to be hisSubjects :
  void removeFromMySubjects(int subject_id) async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/remove-from-my-subjects');
      var response = await http.post(
        url,
        body: {
          "subject_ids": '$subject_id',
        },
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      //? subject added successfully :
      if (decodedResponse["status"] == 200) {
        snackBar sb = snackBar(
          path: 'assets/images/check.png',
          BorderColor: Colors.greenAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Subject Deleted',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
      //? SOMETHING went wrong :
      else {
        snackBar sb = snackBar(
          path: 'assets/images/cross.png',
          BorderColor: Colors.redAccent,
          message: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Something went',
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.mediaQuery.size.width / 25,
              ),
            ),
          ),
        );
        sb.snackbar();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStudentSubjects();
  }

  void getStudentSubjects() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/student-subjects');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      if (decodedResponse["status"] == 200) {
        final List<dynamic> student_subjects = decodedResponse["data"];
        for (int i = 0; i < student_subjects.length; i++) {
          final student_subject = student_subjects[i];
          print(student_subject["id"]);
        }
      } else {
        throw FileNotFoundException(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
