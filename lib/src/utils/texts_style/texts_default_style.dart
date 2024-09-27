import 'package:flutter/material.dart';

class TextDefaultStyle {
  TextDefaultStyle._();

  static final TextDefaultStyle textDefaultStyle = TextDefaultStyle._();

  TextTheme textTheme = const TextTheme(
    displaySmall: TextStyle(
      fontFamily: "GillSansMT",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xff7D848D),
    ),
    displayMedium: TextStyle(
      fontFamily: "Geometr415BlkBTFont",
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: Color(0xff1B1E28),
    ),
    displayLarge: TextStyle(
      fontFamily: "Geometr415BlkBTFont",
      fontSize: 34,
      fontWeight: FontWeight.w400,
      color: Color(0xffFFFFFF),
    ),
    titleLarge: TextStyle(
      fontFamily: "Geometr415BlkBTFont",
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: Color(0xffFF7029),
    ),
    titleMedium: TextStyle(
      fontFamily: "SFUIDisplayRegular",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xff0D6EFD),
    ),
    titleSmall: TextStyle(
      fontFamily: "SFUIDisplayRegular",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontFamily: "SFUIDisplayRegular",
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: Color(0xff1B1E28),
    ),
    headlineMedium: TextStyle(
      fontFamily: "GillSansMT",
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color(0xffCAEAFF),
    ),
    headlineSmall: TextStyle(
      fontFamily: "SFUIDisplayRegular",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xff7D848D),
    ),
    labelMedium: TextStyle(
      fontFamily: "SFUIDisplayRegular",
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xff000000),
    ),
    labelSmall: TextStyle(
      fontFamily: "SFUIDisplayRegular",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xff0D6EFD),
    ),
  );
}
