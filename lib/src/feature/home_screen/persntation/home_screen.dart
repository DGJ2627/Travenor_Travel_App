import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/size_helper/size_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = SizeHelper.sizeHelper.screenWidth(context);
    final height = SizeHelper.sizeHelper.screenHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 44,
                width: 180,
                color: Colors.grey,
              ),
              Container(
                height: 44,
                width: 44,
                color: Colors.grey,
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}
