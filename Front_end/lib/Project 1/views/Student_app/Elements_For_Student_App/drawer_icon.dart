// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:public_testing_app/main.dart';

import '../../../../Themes.dart';

class drawerIcon extends StatelessWidget {
  const drawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Image(
            height: MediaQuery.of(context).size.width / 12,
            width: MediaQuery.of(context).size.width / 10,
            color: is_Dark!.getString('is_dark') == 'true'
                ? Themes.darkColorScheme.primary
                : Themes.colorScheme.primary,
            image: const AssetImage('assets/images/option.png'),
          ),
        );
      },
    );
  }
}
