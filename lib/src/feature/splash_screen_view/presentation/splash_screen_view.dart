import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travenor_app/src/feature/splash_screen_view/presentation/splash_screen_cubit.dart';
import 'package:travenor_app/src/utils/texts/default_app_texts.dart';

import '../../../utils/theme/theme_color.dart';

class SplashScreenView extends StatelessWidget {
  static String routeName = "/SplashScreenView";

  const SplashScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit()..splashScreenTime(context),
      child: const SplashScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenCubit, SplashScreenState>(
      builder: (context, state) {
        if (state is SplashScreenLoading) {
          return Text(
            "Wait",
            style: Theme.of(context).textTheme.displayMedium,
          );
        } else if (state is SplashScreenLoaded) {
          return Scaffold(
            backgroundColor: AppThemeColor.appThemeColor.backGroundColor,
            body: Center(
              child: Text(
                DefaultAppTexts.defaultAppTexts.appName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          );
        } else if (state is SplashScreenError) {
          return Text(
            state.message,
            style: Theme.of(context).textTheme.displayMedium,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
