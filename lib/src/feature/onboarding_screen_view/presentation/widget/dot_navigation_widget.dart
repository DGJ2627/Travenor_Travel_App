import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constant/imagepath_constant/imagepath_constant.dart';
import '../../../../utils/theme/theme_color.dart';
import 'onboarding_screen_widget.dart';

class DotNavigationWidget extends StatelessWidget {
  const DotNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final page = [
      OnboardingWidget(
        imagePath: ImagePath.imagePath.onboardingImage1,
        title: 'Life is short and the ',
        titleSec: 'world is ',
        colorText: 'wide',
        subTitle:
            ' At Friends tours and travel, we customize   \nreliable and trutworthy educational tours to\n \t\t\t\t\t\t\t\t\t\t destinations all over the world,',
      ),
      OnboardingWidget(
        imagePath: ImagePath.imagePath.onboardingImage2,
        title: 'It’s a big world out ',
        titleSec: 'there go ',
        colorText: 'explore',
        subTitle:
            ' At Friends tours and travel, we customize   \n reliable and trutworthy educational tours to\n \t\t\t\t\t\t\t\t\t\t destinations all over the world,',
      ),
      OnboardingWidget(
        imagePath: ImagePath.imagePath.onboardingImage3,
        title: 'People don’t take trips,',
        titleSec: 'trips take ',
        colorText: 'people',
        subTitle:
            ' At Friends tours and travel, we customize   \nreliable and trutworthy educational tours to\n \t\t\t\t\t\t\t\t\t\t destinations all over the world,',
      ),
    ];
    return Positioned(
      bottom: 100,
      left: 140,
      child: SmoothPageIndicator(
        controller: pageController,
        count: page.length,
        effect: WormEffect(
          dotHeight: 8,
          dotWidth: 30,
          dotColor: AppThemeColor.appThemeColor.onboardingDot,
          activeDotColor:
              AppThemeColor.appThemeColor.backGroundColor.withOpacity(0.8),
        ),
      ),
    );
  }
}
