import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/constant/imagepath_constant/imagepath_constant.dart';
import '../../../../../utils/helper/size_helper/size_helper.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = SizeHelper.sizeHelper.screenWidth(context);
    final height = SizeHelper.sizeHelper.screenHeight(context);
    return SizedBox(
      height: height * 0.05,
      width: width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height * 0.05,
            width: width * 0.1,
            child: SvgPicture.asset(ImagePath.imagePath.facebookIcon),
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 0.1,
            child: SvgPicture.asset(ImagePath.imagePath.instagramIcon),
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 0.1,
            child: SvgPicture.asset(ImagePath.imagePath.twitterIcon),
          ),
        ],
      ),
    );
  }
}
