import 'package:flutter/material.dart';
import 'package:travenor_app/src/utils/theme/input_decration_theme.dart';

import '../texts_style/texts_default_style.dart';

class AppTheme {
  AppTheme._();
  static final AppTheme appTheme = AppTheme._();
  ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextDefaultStyle.textDefaultStyle.textTheme,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffFFFFFF),
    primaryColorLight: const Color(0xffFFFFFF),
    inputDecorationTheme:
        CustomTextFormField.customTextFormField.textFormFieldDecoration,
  );
}
