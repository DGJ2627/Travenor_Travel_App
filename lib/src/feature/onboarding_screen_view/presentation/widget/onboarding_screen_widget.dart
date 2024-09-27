import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../utils/constant/imagepath_constant/imagepath_constant.dart';
import '../../../../utils/helper/size_helper/size_helper.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.titleSec,
    required this.colorText,
    required this.subTitle,
  });

  final String imagePath;
  final String title;
  final String titleSec;
  final String colorText;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final height = SizeHelper.sizeHelper.screenHeight(context);
    final width = SizeHelper.sizeHelper.screenWidth(context);
    return Center(
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            height: height * 0.56,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          const Gap(30),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleSec,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Column(
                children: [
                  Text(
                    colorText,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: height * 0.010,
                    width: height * 0.062,
                    child:
                        Image.asset(ImagePath.imagePath.onboardingObjectImage),
                  ),
                ],
              ),
            ],
          ),
          const Gap(20),
          Container(
            alignment: AlignmentDirectional.center,
            height: 72,
            width: width,
            child: Center(
              child: Text(
                subTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
          const Gap(20),
          Container(
            alignment: AlignmentDirectional.center,
            height: 72,
            width: width,
            child: Center(
              child: Text(
                " At Friends tours and travel, we customize   \nreliable and trutworthy educational tours to\n \t\t\t\t\t\t\t\t\t\t destinations all over the world",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          const Gap(20),
          DotsIndicator(
            dotsCount: 3,
            position: 0,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppThemeColor.appThemeColor.backGroundColor,
              color: AppThemeColor.appThemeColor.onboardingDot,
              activeSize: const Size(35.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          const Gap(20),
          const CustomTapButton(
            btnHeight: 56,
            btnWidth: 335,
            btnName: 'Get Started',
          )
 */
