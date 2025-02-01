import 'package:flutter/material.dart';

import 'package:celebrate_app/theme.dart';

class FormFieldDeskripsi extends StatelessWidget {
  const FormFieldDeskripsi({
    super.key,
    required this.labelField,
    required this.hinTxt,
    required this.controller,
  });

  final TextEditingController controller;
  final String labelField;
  final String hinTxt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: blackTextStyle.copyWith(fontSize: 14),
      decoration: InputDecoration(
        hintText: hinTxt,
        labelText: labelField,
        hintStyle: subtitleTextStyle.copyWith(fontSize: 14),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: primaryTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: primaryColor,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: primaryColor,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
      maxLines: 3,
    );
  }
}
