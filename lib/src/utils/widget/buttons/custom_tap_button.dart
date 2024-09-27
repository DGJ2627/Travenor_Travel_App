import 'package:flutter/material.dart';

import '../../theme/theme_color.dart';

class CustomTapButton extends StatelessWidget {
  const CustomTapButton({
    super.key,
    required this.btnHeight,
    required this.btnWidth,
    required this.btnName,
    this.onTap,
  });

  final double btnHeight;
  final double btnWidth;
  final String btnName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: btnHeight,
        width: btnWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppThemeColor.appThemeColor.backGroundColor,
        ),
        child: Text(
          btnName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
