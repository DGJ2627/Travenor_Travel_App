import 'package:flutter/cupertino.dart';

class SizeHelper {
  SizeHelper._();
  static final SizeHelper sizeHelper = SizeHelper._();

  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
