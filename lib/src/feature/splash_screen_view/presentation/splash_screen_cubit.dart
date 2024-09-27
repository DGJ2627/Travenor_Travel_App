import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:travenor_app/src/feature/onboarding_screen_view/presentation/onboarding_screen_view.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  Future<void> splashScreenTime(BuildContext context) async {
    try {
      final timerOver = Timer(
        const Duration(milliseconds: 500),
        () => Navigator.pushNamedAndRemoveUntil(
          context,
          OnboardingScreenView.routeName,
          (route) => true,
        ),
      );
      print("object");
      print("done");
      print("object");
      emit(SplashScreenLoaded(timerOver));
    } catch (e) {
      String message = e.toString();
      emit(
        SplashScreenError(message),
      );
    }
  }
}
