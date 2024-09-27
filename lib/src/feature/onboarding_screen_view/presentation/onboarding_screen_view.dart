import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travenor_app/src/feature/login_system/login/presntation/login_screen_view/login_screen_view.dart';

import 'package:travenor_app/src/feature/onboarding_screen_view/presentation/onboarding_screen_cubit.dart';
import 'package:travenor_app/src/feature/onboarding_screen_view/presentation/widget/onboarding_screen_widget.dart';
import 'package:travenor_app/src/utils/helper/size_helper/size_helper.dart';

import '../../../utils/constant/imagepath_constant/imagepath_constant.dart';
import '../../../utils/theme/theme_color.dart';
import '../../../utils/widget/buttons/custom_tap_button.dart';

class OnboardingScreenView extends StatelessWidget {
  static String routeName = "/OnboardingScreenView";

  const OnboardingScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingScreenCubit()..updatePage(0),
      child: const OnboardingScreenView(),
    );
  }

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

    final height = SizeHelper.sizeHelper.screenHeight(context);
    final width = SizeHelper.sizeHelper.screenWidth(context);
    return BlocBuilder<OnboardingScreenCubit, OnboardingScreenState>(
        builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              itemCount: page.length,
              controller: pageController,
              onPageChanged: (index) {
                context
                    .read<OnboardingScreenCubit>()
                    .emit(OnboardingScreenState(currentPage: index));
              },
              itemBuilder: (BuildContext context, int index) {
                return page[index];
              },
            ),
            Positioned(
              top: 70,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  // context.read<OnboardingScreenCubit>().skipOnboarding();
                },
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.14,
              left: width * 0.36,
              child: SmoothPageIndicator(
                controller: pageController,
                count: page.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 30,
                  dotColor: AppThemeColor.appThemeColor.onboardingDot,
                  activeDotColor: AppThemeColor.appThemeColor.backGroundColor
                      .withOpacity(0.8),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.026,
              left: width * 0.1,
              child: CustomTapButton(
                btnHeight: height * 0.06,
                btnWidth: width * 0.8,
                btnName: state.currentPage == 0 ? 'Get started' : 'Next',
                onTap: () {
                  if (state.currentPage == 2) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreenView.routeName,
                      (route) => false,
                    );
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
