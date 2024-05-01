// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.Text_Position,
    this.Pass_Security,
    this.TextController,
    required this.validate,
    required this.save,
    this.keyboard,
    super.key,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final TextEditingController? TextController;
  final TextInputType? keyboard;
  final String? Function(String? value) validate;
  final void Function(String? value) save;
  final bool? Pass_Security;
  final TextAlign? Text_Position;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: TextFormField(
        textAlign: Text_Position ?? TextAlign.start,
        obscureText: Pass_Security ?? false,
        controller: TextController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          label: Text(
            label!,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: MediaQuery.of(context).size.width / 30),
          ),
          filled: true,
          fillColor: Get.isDarkMode ? Colors.black54 : Colors.grey.shade400,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        keyboardType: keyboard,
        validator: validate,
        onSaved: save,
        obscuringCharacter: '*',
        textCapitalization: TextCapitalization.none,
      ),
    );
  }
}
