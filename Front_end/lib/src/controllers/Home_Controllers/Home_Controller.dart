// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable, camel_case_types, missing_required_param, unused_catch_clause

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:public_testing_app/main.dart';
import 'package:public_testing_app/src/models/SnackBar.dart';
import 'package:public_testing_app/src/models/Themes.dart';
import 'package:public_testing_app/src/views/src/Home/fifth_Page/Files.dart';
import 'package:public_testing_app/src/views/src/Home/fourth_Page/FilesTypes.dart';
import 'package:public_testing_app/src/views/src/Home/second_Page/subjects.dart';
import '../../views/src/Home/third_Page/subjectType.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //? Saved Files Lists :
  List<Map<String, dynamic>> savedFiles_information = [];
  List<bool> isStudentSavedFiles = [];
  List<int> saved_files_ids = [];
  List<String> saved_files_paths = [];

  //? Data for Viewing page :
  ScrollController scrollController = ScrollController();
  List<String> years = ['First Year', 'Second Year', 'Third Year'];
  List<String> photo_paths_of_years = [
    'assets/images/data-scientist.png',
    'assets/images/engineer.png',
    'assets/images/coordinator.png'
  ];
  List<String> numbers_of_years = ['1.', '2.', '3.'];
  String SelectedChoice = 'TP';

  //? THeoritical SUBJECTS and DOCTORS  names :
  List<String> name_of_th_subjects = [];
  List<List<dynamic>> doctors_theoritical = [];
  List<int> subjects_theoritical_ids = [];
  List<int> subjects_practical_ids = [];
  List<bool> isAdded_theoritical = [];
  List<bool> isAdded_practical = [];

  //? Practical SUBJECTS and DOCTORS  names :
  List<String> name_of_pr_subjects = [];
  List<String> doctor_practical = [];

  //? circle indicaters :
  Widget? circleViewSubject;
  Widget? circleViewFilesTypes;

  //? Files Types Variebles :
  List<String> files_types_photos = [
    'assets/images/addvertise.png',
    'assets/images/gallery.png',
    'assets/images/file.png',
    'assets/images/doc-file.png',
    'assets/images/ppt-file.png',
  ];
  List<String> files_types_names = [
    'add`s',
    'images',
    'pdf`s',
    'word`s',
    'powerpoint `s',
  ];

  //? variables for fifth page :
  List<String> files_names = [];
  Widget? circle_for_files;
  List<bool> is_added_to_saved_files = [];
  List<bool> is_downloaded = [];
  Files_Types ctrl_type = Files_Types.adds;
  Widget? download_circle;
  List<int> files_ids = [];
  List<String> files_paths = [];
  File? files_content;
  double _progress = 0;

  // this function for fetching the subjects :
  void viewSubjectsOfTheYear(int yearNumber) async {
    // UPDATE the button to CircularProgressIndicator while fetching data :
    circleViewSubject = const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      ),
    );
    update(["viewSubject"]);

    //! send request to server for fetching Theoritical Subjects :
    try {
      var url = Uri.parse(
          'http://10.0.2.2:8000/api/year-subjects-theoretical/$yearNumber');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      if (decodedResponse["status"] == 200) {
        List<dynamic> TheoriticalSubjects = decodedResponse["data"];

        // IF the response status are correct we will save the subjects names and its doctors :
        if (decodedResponse["status"] == 200) {
          name_of_th_subjects = [];
          doctors_theoritical = [];
          isAdded_theoritical = [];
          isAdded_practical = [];
          subjects_theoritical_ids = [];
          for (int i = 0; i < TheoriticalSubjects.length; i++) {
            final Map<String, dynamic> TH_S = TheoriticalSubjects[i];

            TH_S.forEach(
              (key, value) {
                if (key == "name") {
                  name_of_th_subjects.add(value);
                  isAdded_theoritical.add(false);
                  isAdded_practical.add(false);
                } else if (key == "doctors") {
                  doctors_theoritical.add(value);
                } else if (key == "id") {
                  subjects_theoritical_ids.add(value);
                }
              },
            );
          }
        }
        // FETCHING student subjects :
        fetchStudentSubjectsForChecking();
      } else {
        throw FileNotFoundException(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    //! send request to server for fetching Practical Subjects :
    try {
      var url = Uri.parse(
          'http://10.0.2.2:8000/api/year-subjects-practical/$yearNumber');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      List<dynamic> PracticalSubjects = decodedResponse["data"];

      // IF the response status are correct we will save the subjects names and its teachers :
      if (decodedResponse["status"] == 200) {
        name_of_pr_subjects = [];
        doctor_practical = [];
        subjects_practical_ids = [];
        for (int i = 0; i < PracticalSubjects.length; i++) {
          final Map<String, dynamic> PR_S = PracticalSubjects[i];
          log(PR_S.toString());

          PR_S.forEach(
            (key, value) {
              if (key == "name") {
                name_of_pr_subjects.add(value);
              } else if (key == "teacher") {
                if (value == null) {
                  doctor_practical.add('');
                } else {
                  doctor_practical.add(value);
                }
              } else if (key == "id") {
                subjects_practical_ids.add(value);
              }
            },
          );
        }
      } else {
        throw FileNotFoundException(response.body);
      }
    } catch (e) {
      log(e.toString());
    }

    //disActive the circle cause the response are proccessed successfuly :
    circleViewSubject = null;
    update(["viewSubject"]);
    // go to the subjects screen and passing subjects to it :
    Get.to(
      () => Subjects.subject(
        id: yearNumber,
        subjects: name_of_th_subjects,
        years: years,
        Subjects_ids: subjects_theoritical_ids,
      ),
    );
    //? save theoritical subjects :
    appData!
        .setStringList('Subjects_Of_The_Year_Theoritical', name_of_th_subjects);
    //? save theoritical subjects :
    appData!
        .setStringList('Subjects_Of_The_Year_Practical', name_of_pr_subjects);

    for (int i = 0; i < name_of_th_subjects.length; i++) {
      if (!name_of_pr_subjects.contains(name_of_th_subjects[i])) {
        subjects_practical_ids.insert(i, 0);
      }
    }

    log(subjects_practical_ids.toString());
  }

  // this function for adding the subjects choosed from student to be hisSubjects :
  void addToMySubjects(int subject_id, int index) async {
    //! sending request :
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/add-to-my-subjects');
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
        if (subjects_theoritical_ids.contains(subject_id)) {
          isAdded_theoritical[index] = true;
        }
        if (subjects_practical_ids.contains(subject_id)) {
          isAdded_practical[index] = true;
        }

        update(["add_reomve_subject"]);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // this function for removing the subjects choosed from student to be hisSubjects :
  void removeFromMySubjects(int subject_id, int index) async {
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
        isAdded_theoritical[index] = false;
        update(["add_reomve_subject"]);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // this function for viewing the theoritical part of the subject and practical part if it is exist :
  void viewSubjectTypes(int index, String subject, int year) {
    final sub_just_th = doctors_theoritical.length - doctor_practical.length;

    String teacher = '';
    List<dynamic> doctors = [];
    for (int i = 0; i < name_of_th_subjects.length; i++) {
      if (subject == name_of_th_subjects[i]) {
        for (int j = 0; j < doctors_theoritical.length; j++) {
          if (j == i) {
            doctors = doctors_theoritical[j];
            break;
          }
        }
        for (int j = 0; j < doctor_practical.length; j++) {
          if (j == (i - sub_just_th)) {
            teacher = doctor_practical[j];
            break;
          }
        }
        break;
      }
      log(doctors_theoritical.toString());
    }
    Get.to(
      () => Subjecttype(
        year: year,
        index: index + 1,
        subjectName: subject,
        teacher: teacher,
        doctors: doctors,
      ),
    );
  }

  // this function to check if the subjects has practical part or not :
  bool isHasPractical(String subjectName) {
    List<String> Practicals =
        appData!.getStringList('Subjects_Of_The_Year_Practical')!;
    if (Practicals.contains(subjectName)) {
      return true;
    }
    return false;
  }

  // this function for viewing fileTypes for the speciefic part of the subject :
  void viewFilesTypes(String type, String subject_name, int year) {
    Get.to(() => Filestypes(
          year: year,
          subject_type: type,
          subject_name: subject_name,
        ));
  }

  // this function for auto scrolling for years cards in home :
  void listenToScrollMoment() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 3 * 10),
          curve: Curves.linear,
        );
      },
    );
  }

  // fetch student subjects :
  void fetchStudentSubjectsForChecking() async {
    try {
      var url =
          Uri.parse('http://10.0.2.2:8000/api/student-subjects-theoretical');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      if (decodedResponse['status'] == 200) {
        final List<dynamic> studentSubjects = decodedResponse["data"];
        for (int i = 0; i < studentSubjects.length; i++) {
          final Map<String, dynamic> student_subject = studentSubjects[i];

          for (int j = 0; j < name_of_th_subjects.length; j++) {
            if (name_of_th_subjects[j] == student_subject["name_subject"]) {
              isAdded_theoritical[j] = true;
              update(["add_reomve_subject"]);
            }
          }
        }
      } else {
        log("error");
      }
    } catch (e) {
      log(e.toString());
    }

    try {
      var url =
          Uri.parse('http://10.0.2.2:8000/api/student-subjects-practical');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      if (decodedResponse['status'] == 200) {
        final List<dynamic> studentSubjects = decodedResponse["data"];
        for (int i = 0; i < studentSubjects.length; i++) {
          final Map<String, dynamic> student_subject = studentSubjects[i];

          for (int j = 0; j < name_of_pr_subjects.length; j++) {
            if (name_of_pr_subjects[j] == student_subject["name_subject"]) {
              isAdded_practical[j] = true;
            }
          }
        }
        log(isAdded_practical.toString());
      } else {
        log("error");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // viewing bottom sheet for adding subjects :
  Future dialog_for_adding_subject_to_MySubjects(
      BuildContext context, int subject_id, int index) async {
    log(name_of_th_subjects[index].toString());
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation_1, animation_2) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, widget) {
        return ShowDialog(subject_id, index, a1, a2);
      },
    );
  }

  // bottom Sheet to choose image source : (Gallery || Camera): //? not done :
  Widget ShowDialog(
      int subject_id, int index, Animation<double> a1, Animation<double> a2) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
        child: AlertDialog(
          backgroundColor: Themes.getColor(
              Themes.darkColorScheme.primaryContainer,
              Themes.colorScheme.primaryContainer),
          content: SizedBox(
            width: Get.size.width - 100,
            height: Get.size.width - 180,
            child: GetBuilder<HomeController>(
              id: 'add_TP_or_T',
              builder: (controller) {
                return Stack(
                  children: [
                    // title :
                    Text(
                      'add to My Subjects :',
                      style: Get.textTheme.titleLarge!.copyWith(fontSize: 25),
                    ),
                    // TP :
                    Positioned(
                      top: 55,
                      child: RadioMenuButton(
                        value: 'TP',
                        groupValue: SelectedChoice,
                        onChanged: (value) {
                          SelectedChoice = value!;
                          update(['add_TP_or_T']);
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Themes.getColor(
                                Themes.darkColorScheme.primaryContainer,
                                Themes.colorScheme.primaryContainer),
                          ),
                        ),
                        child: Text(
                          'Theoritical and Practical.',
                          style:
                              Get.textTheme.titleLarge!.copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                    // P :
                    Positioned(
                      top: 110,
                      child: RadioMenuButton(
                        value: 'T',
                        groupValue: SelectedChoice,
                        onChanged: (value) {
                          SelectedChoice = value!;
                          update(['add_TP_or_T']);
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Themes.getColor(
                                Themes.darkColorScheme.primaryContainer,
                                Themes.colorScheme.primaryContainer),
                          ),
                        ),
                        child: Text(
                          'Theoritical.',
                          style:
                              Get.textTheme.titleLarge!.copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                    // add button :
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              blurRadius: 2,
                              offset: Offset(0, 0.5),
                            )
                          ],
                          color: Themes.colorScheme.onPrimaryContainer
                              .withOpacity(.8),
                          border: Border.all(
                            width: 2,
                            color: is_Dark!.getString('is_dark') == 'true'
                                ? Themes.darkColorScheme.primary
                                : Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: Get.size.width / 5,
                        height: Get.size.height / 19,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if (SelectedChoice == "T") {
                                addToMySubjects(subject_id, index);
                                Get.back();
                              } else if (SelectedChoice == "TP") {
                                addToMySubjects(subject_id, index);
                                int sub_id = subjects_practical_ids[index];
                                addToMySubjects(sub_id, index);
                                Get.back();
                              }
                            },
                            child: Text(
                              'add',
                              style: Get.textTheme.titleLarge!
                                  .copyWith(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // cancel button :
                    Positioned(
                      bottom: 0,
                      right: 90,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              blurRadius: 2,
                              offset: Offset(0, 0.5),
                            )
                          ],
                          color: Themes.colorScheme.onPrimaryContainer
                              .withOpacity(.8),
                          border: Border.all(
                            width: 2,
                            color: is_Dark!.getString('is_dark') == 'true'
                                ? Themes.darkColorScheme.primary
                                : Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: Get.size.width / 5,
                        height: Get.size.height / 19,
                        child: Center(
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: Text(
                              'cancel',
                              style: Get.textTheme.titleLarge!
                                  .copyWith(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  //? Fourth and Fifth Pages Functions:
  // finally done :
  void get_files_names_for_type(Files_Types type, String subject_type,
      String subject_name, int year) async {
    int? id;
    files_ids = [];
    files_names = [];
    is_added_to_saved_files = [];
    is_downloaded = [];
    files_paths = [];

    ctrl_type = type;

    circle_for_files = const CircularProgressIndicator(
      color: Colors.white,
      strokeWidth: 2,
    );
    update(["go_to_files"]);
    if (subject_type == "Theoritical") {
      int i = name_of_th_subjects.indexOf(subject_name);
      id = subjects_theoritical_ids[i];
    } else if (subject_type == "Practical") {
      int i = name_of_pr_subjects.indexOf(subject_name);
      id = subjects_practical_ids[i];
    }
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/get-files-names');
      var response = await http.post(url, headers: {
        "Authorization": "Bearer ${Auth!.getString('token')}",
      }, body: {
        "year_id": "$year",
        "subject_id": "$id",
        "file_type": "$ctrl_type".substring(12),
      });
      final decodedResponse = json.decode(response.body);
      if (decodedResponse["status"] == 200) {
        for (int i = 0; i < decodedResponse["data"].length; i++) {
          Map<String, dynamic> FN = decodedResponse["data"][i];
          is_added_to_saved_files.add(false);
          is_downloaded.add(false);

          FN.forEach(
            (key, value) {
              if (key == "id") {
                files_ids.add(value);
              } else if (key == "file_name") {
                files_names.add(value);
              } else if (key == "file_path") {
                files_paths.add(value);
              }
            },
          );
        }
      }
      circle_for_files = null;
      update(["go_to_files"]);
      log(files_ids.toString());
      log(appData!.getString("photo[33]")!);
    } catch (e) {
      log(e.toString());
    }
    getSavedFiles();

    Get.to(
      () => Files(
        type: type,
        subject_name: subject_name,
        year: year,
        subject_type: subject_type,
      ),
    );
  }

  // get student saved Files :
  void getSavedFiles() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/student-files');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      for (int i = 0; i < decodedResponse["data"].length; i++) {
        final Map<String, dynamic> SF = decodedResponse["data"][i];
        SF.forEach(
          (key, value) {
            if (key == "id") {
              bool isSaved = files_ids.contains(value);
              if (isSaved) {
                int index = files_ids.indexOf(value);
                is_added_to_saved_files[index] = true;
                update(['saved_files']);
              }
            }
          },
        );
      }
    } catch (e) {
      e.toString();
    }
  }

  // finally done :
  void add_to_saved_files(int id, int index) async {
    //! sending file to server :
    is_added_to_saved_files[index] = true;
    update(['saved_files']);

    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/add-to-my-files');
      var response = await http.post(
        body: {
          "file_id": "$id",
        },
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      log(decodedResponse["status"].toString());
    } catch (e) {
      e.toString();
    }
  }

  // finally doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :
  void download_file(int index, String type) async {
    try {
      download_circle = GetBuilder<HomeController>(
        id: 'download_file',
        builder: (controller) {
          return Center(
              child: Text(
            '$_progress %',
            style: const TextStyle(color: Colors.white),
          ));
        },
      );
      update(['download[$index]']);
      int downloadid;

      if (appData!.getString("connection_result") !=
          "[ConnectivityResult.none]") {
        files_content = await FileDownloader.downloadFile(
          url: "http://10.0.2.2:8000/${files_paths[index]}",
          name: files_paths[index].substring(10).replaceAll(' ', ''),
          subPath: "files/$type",
          onProgress: (String? fileName, double progress) {
            _progress = progress;
            update(['download_file']);
            log('FILE fileName HAS PROGRESS $progress');
          },
          onDownloadCompleted: (String path) {
            _progress = 0;
            log('FILE DOWNLOADED TO PATH: $path');
          },
          onDownloadError: (String error) {
            download_circle = null;
            FileDownloader.cancelDownload;
            update(["download[$index]"]);
            snackBar sb = snackBar(
              path: "assets/images/cross.png",
              BorderColor: Colors.red,
              title: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "SomeThing Went",
                  style: Get.theme.textTheme.titleMedium,
                ),
              ),
              message: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Wrong !",
                  style: Get.theme.textTheme.titleMedium,
                ),
              ),
            );
            sb.snackbar();
          },
        ).timeout(const Duration(minutes: 5));
      } else {
        download_circle = null;
        update(["download[$index]"]);
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
        snackBar sb = snackBar(
          BorderColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "No Internet",
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
          message: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Connection !",
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
        );
        sb.snackbar();
        return;
      }

      download_circle = null;
      if (files_content != null) {
        appData!
            .setString("file[$type][${files_ids[index]}]", files_content!.path);
        FileDownloader.cancelDownload;
      }
      update(["download[$index]"]);
    } on PlatformException catch (e) {
      snackBar sb = snackBar(
        path: "assets/images/cross.png",
        BorderColor: Colors.red,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "weak Internet",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
        message: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Connection !",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
      );
      sb.snackbar();
      download_circle = null;
      update(["download[$index]"]);
      FileDownloader.cancelDownload;
    } catch (e) {
      snackBar sb = snackBar(
        path: "assets/images/cross.png",
        BorderColor: Colors.red,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "SomeThing Went",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
        message: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Wrong !",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
      );
      sb.snackbar();
      download_circle = null;
      update(["download[$index]"]);
      FileDownloader.cancelDownload;
      log(e.toString());
    }
  }

  // download image Finally Doneeeeeeeeeeeeeeeeeee :
  void download_image(int index) async {
    try {
      download_circle = GetBuilder<HomeController>(
          id: 'circle_in',
          builder: (controller) {
            return CircularProgressIndicator(
              value: _progress,
              color: Colors.black,
              strokeWidth: 2,
            );
          });
      update(['is_image_downloaded[$index]']);
      if (appData!.getString("connection_result") !=
          "[ConnectivityResult.none]") {
        files_content = await FileDownloader.downloadFile(
          url: "http://10.0.2.2:8000/${files_paths[index]}",
          name: files_paths[index].substring(12).replaceAll(' ', ''),
          subPath: "files/images",
          onProgress: (String? fileName, double progress) {
            _progress = progress / 100;
            update(['circle_in']);
            log('FILE fileName HAS PROGRESS $progress');
          },
          onDownloadCompleted: (String path) {
            _progress = 0;
            log('FILE DOWNLOADED TO PATH: $path');
          },
          onDownloadError: (String error) {
            download_circle = null;
            update(["download_image[$index]"]);
            snackBar sb = snackBar(
              path: "assets/images/cross.png",
              BorderColor: Colors.red,
              title: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "SomeThing Went",
                  style: Get.theme.textTheme.titleMedium,
                ),
              ),
              message: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Wrong !",
                  style: Get.theme.textTheme.titleMedium,
                ),
              ),
            );
            sb.snackbar();
          },
        ).timeout(const Duration(minutes: 2));
      } else {
        download_circle = null;
        update(["download_image[$index]"]);
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
        snackBar sb = snackBar(
          BorderColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "No Internet",
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
          message: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Connection !",
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
        );
        sb.snackbar();
        return;
      }
      download_circle = null;
      if (files_content != null) {
        appData!.setString("photo[${files_ids[index]}]", files_content!.path);
      }
      update(["download_image[$index]"]);
      files_content = null;
    } catch (e) {
      log(e.toString());
    }
  }

  //? Saved Files Section Functions :

  void download_saved_file(int index, String type) async {
    try {
      download_circle = GetBuilder<HomeController>(
        id: 'download_file',
        builder: (controller) {
          return Center(
              child: Text(
            '$_progress %',
            style: const TextStyle(color: Colors.white),
          ));
        },
      );
      update(['saved_files_download[$index]']);

      if (appData!.getString("connection_result") !=
          "[ConnectivityResult.none]") {
        files_content = await FileDownloader.downloadFile(
          url: "http://10.0.2.2:8000/${saved_files_paths[index]}",
          name: saved_files_paths[index].substring(10).replaceAll(' ', ''),
          subPath: "files/$type",
          onProgress: (String? fileName, double progress) {
            _progress = progress;
            update(['download_file']);
            log('FILE fileName HAS PROGRESS $progress');
          },
          onDownloadCompleted: (String path) {
            _progress = 0;
            log('FILE DOWNLOADED TO PATH: $path');
          },
          onDownloadError: (String error) {
            download_circle = null;
            FileDownloader.cancelDownload;
            update(["saved_files_download[$index]"]);
            snackBar sb = snackBar(
              path: "assets/images/cross.png",
              BorderColor: Colors.red,
              title: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "SomeThing Went",
                  style: Get.theme.textTheme.titleMedium,
                ),
              ),
              message: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Wrong !",
                  style: Get.theme.textTheme.titleMedium,
                ),
              ),
            );
            sb.snackbar();
          },
        ).timeout(const Duration(minutes: 5));
      } else {
        download_circle = null;
        update(["saved_files_download[$index]"]);
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
        snackBar sb = snackBar(
          BorderColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "No Internet",
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
          message: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Connection !",
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
        );
        sb.snackbar();
        return;
      }

      download_circle = null;
      if (files_content != null) {
        appData!
            .setString("file[$type][${saved_files_ids[index]}]", files_content!.path);
        FileDownloader.cancelDownload;
      }
      update(["saved_files_download[$index]"]);
    } on PlatformException catch (e) {
      snackBar sb = snackBar(
        path: "assets/images/cross.png",
        BorderColor: Colors.red,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "weak Internet",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
        message: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Connection !",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
      );
      sb.snackbar();
      download_circle = null;
      update(["saved_files_download[$index]"]);
      FileDownloader.cancelDownload;
    } catch (e) {
      snackBar sb = snackBar(
        path: "assets/images/cross.png",
        BorderColor: Colors.red,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "SomeThing Went",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
        message: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Wrong !",
            style: Get.theme.textTheme.titleMedium,
          ),
        ),
      );
      sb.snackbar();
      download_circle = null;
      update(["saved_files_download[$index]"]);
      FileDownloader.cancelDownload;
      log(e.toString());
    }
  }

  void getStudentSavedFiles() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/student-files');
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      if (decodedResponse["status"] == 200) {
        savedFiles_information = [];
        isStudentSavedFiles = [];
        saved_files_ids = [];
        for (int i = 0; i < decodedResponse["data"].length; i++) {
          final Map<String, dynamic> SF = decodedResponse["data"][i];
          savedFiles_information.add(SF);
          isStudentSavedFiles.add(true);
          saved_files_ids.add(SF["id"]);
          saved_files_paths.add(SF["file_path"]);
        }
        update(["student_saved_files"]);
      }
    } catch (e) {
      e.toString();
    }
  }

  void remove_from_saved_files(int file_id, int index) async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/remove-from-my-files');
      var response = await http.post(
        body: {
          "file_id": "$file_id",
        },
        url,
        headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        },
      );
      final decodedResponse = json.decode(response.body);
      if (decodedResponse["status"] == 200) {
        savedFiles_information.removeAt(index);
        isStudentSavedFiles.removeAt(index);
        update(["student_saved_files"]);
      }
    } catch (e) {
      e.toString();
    }
  }

  @override
  void onInit() async {
    appData!.setBool('isSeeAll', false);
    listenToScrollMoment();
    log(Auth!.getString("token").toString());

    final baseStorage = await getApplicationDocumentsDirectory();
    log(baseStorage.path);
    appData!.setString("cache_path", "${baseStorage.path}/");
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
