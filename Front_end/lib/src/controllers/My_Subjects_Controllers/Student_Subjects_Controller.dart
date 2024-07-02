import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/models/SnackBar.dart';
import 'package:http/http.dart' as http;

class StudentSubjectsController extends GetxController {
  List<String> student_subjects = ['programing 1', 'algorithemes 2'];
  List<int> Subjects_ids = [45, 26, 24];
  List<int> year_id = [1, 2];

  void remove_subject(String subject_name, BuildContext context,
      List<String> student_subjects, int subject_id) async {
    final index = student_subjects.indexOf(subject_name);

    student_subjects.remove(subject_name);
    update(['subjects']);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('subject Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            student_subjects.insert(index, subject_name);
            update(['subjects']);
            return;
          },
        ),
      ),
    );
    // sending http request to server to remove the subject :
    removeFromMySubjects(subject_id);
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
}
