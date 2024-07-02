// ignore_for_file: file_names, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Home_Controllers/Home_Controller.dart';

import '../../../../../main.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> content = [
      SizedBox(
        height: appData!.getBool('isSeeAll')! ? height / 3.5 : height / 15,
      ),
      Image(
        width: !appData!.getBool('isSeeAll')! ? width / 4 : width / 3,
        height: !appData!.getBool('isSeeAll')! ? height / 8 : height / 6,
        image: const AssetImage('assets/images/out-of-stock.png'),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'No Recent Files',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  'Recent Files :',
                  style: appData!.getBool('isSeeAll')!
                      ? Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: width * 0.06,
                          )
                      : Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: width * 0.05,
                          ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: InkWell(
                        onTap: onTap,
                        child: Text(
                          appData!.getBool('isSeeAll')! ? 'Hide' : 'see all',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: width * 0.05,
                                    color: Colors.blueAccent,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        GetBuilder<HomeController>(
          id: 'recent_files',
          init: HomeController(),
          builder: (bt_nav_controller) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [...content],
              ),
            );
          },
        ),
      ],
    );
  }
}
