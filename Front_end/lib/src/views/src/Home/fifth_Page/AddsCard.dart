import 'package:flutter/material.dart';

class AddsCard extends StatelessWidget {
  const AddsCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    );
  }
}
