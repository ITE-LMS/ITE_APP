// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MySwitchListTile extends StatelessWidget {
  const MySwitchListTile(
      {super.key,
      required this.onChanged,
      required this.label,
      this.subTitle,
      required this.icon,
      this.is_active});

  final bool? is_active;
  final void Function(bool? value) onChanged;
  final String label;
  final Widget? subTitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: is_active ??  Get.isDarkMode ? true : false,
      onChanged: onChanged,
      title: Row(
        children: [
          icon,
          const SizedBox(width: 15),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: MediaQuery.of(context).size.width / 23),
          ),
        ],
      ),
      subtitle: subTitle,
    );
  }
}
