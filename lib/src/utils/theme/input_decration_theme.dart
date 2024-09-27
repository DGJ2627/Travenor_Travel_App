import 'package:flutter/material.dart';

class CustomTextFormField {
  CustomTextFormField._();

  static final CustomTextFormField customTextFormField =
      CustomTextFormField._();

  InputDecorationTheme textFormFieldDecoration = InputDecorationTheme(
    suffixIconColor: const Color(0xff7D848D),
    prefixIconColor: const Color(0xff7D848D),
    filled: true,
    labelStyle: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xff7D848D),
        fontFamily: "SFUIDisplayRegular"),
    fillColor: const Color(0xffF7F7F9),
    errorMaxLines: 2,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  );
}
