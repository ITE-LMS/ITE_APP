// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SignInContainer extends StatelessWidget {
  const SignInContainer({
    required this.onTap,
    required this.leading,
    required this.trailing,
    super.key,
  });

  final String leading;
  final String trailing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 6,
        vertical: MediaQuery.of(context).size.height / 200,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 65,
          ),
          backgroundColor: Colors.grey.withOpacity(.3),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(leading),
              width: MediaQuery.of(context).size.width / 10,
              height: MediaQuery.of(context).size.width / 13,
            ),
            const SizedBox(width: 10),
            Text(
              trailing,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: MediaQuery.of(context).size.width / 25),
            ),
          ],
        ),
      ),
    );
  }
}
