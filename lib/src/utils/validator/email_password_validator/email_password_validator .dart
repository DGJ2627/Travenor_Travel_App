import 'package:flutter/cupertino.dart';

class EmailAndPasswordValidator {
  EmailAndPasswordValidator._();

  static final EmailAndPasswordValidator validator =
      EmailAndPasswordValidator._();

  final globalKey = GlobalKey<FormState>();
  final globalKeySignUp = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    const pattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}
