// ignore_for_file: file_names, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:public_testing_app/src/controllers/Home/Home_Controller.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    List<Widget> content = [
      SizedBox(
        height: controller.isSeeAll
            ? MediaQuery.of(context).size.height / 3.4
            : MediaQuery.of(context).size.height / 6,
      ),
      Image(
        width: !controller.isSeeAll
            ? MediaQuery.of(context).size.width / 3.5
            : MediaQuery.of(context).size.width / 3,
        height: !controller.isSeeAll
            ? MediaQuery.of(context).size.width / 3.5
            : MediaQuery.of(context).size.width / 3,
        image: const AssetImage('assets/images/out-of-stock.png'),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        'No Recent Files',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ];

    if (controller.recentFiles.isNotEmpty) {}

    return Expanded(
      child: Column(
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
                    style: controller.isSeeAll
                        ? Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                            )
                        : Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
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
                            controller.isSeeAll ? 'cancel' : 'see all',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [...content],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
