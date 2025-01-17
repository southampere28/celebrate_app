import 'package:celebrate_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback ontap;
  final String title;

  const ButtonPrimary({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: ontap,
        style: TextButton.styleFrom(
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Text(
          title,
          style: buttonTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
        ),
      ),
    );
    ;
  }
}
