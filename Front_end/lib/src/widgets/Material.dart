// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyMaterial extends StatelessWidget {
  MyMaterial({super.key, required this.text, required this.isVideosSeecton});

  final String text;
  bool isVideosSeecton = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: () {},
        color: isVideosSeecton
            ? const Color(0xff674AEF)
            : const Color(0xff674AEF).withOpacity(0.6),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 19,
          width: MediaQuery.of(context).size.width / 3.7,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
