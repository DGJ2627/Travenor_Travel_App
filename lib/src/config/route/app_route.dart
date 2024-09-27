import 'package:flutter/cupertino.dart';
import 'package:travenor_app/src/feature/login_system/forgot_password/presntatiion/forgot_password_screen.dart';
import 'package:travenor_app/src/feature/login_system/login/presntation/login_screen_view/login_screen_view.dart';
import 'package:travenor_app/src/feature/login_system/otp_verification_screen/persntation/otp_verification_screen.dart';
import 'package:travenor_app/src/feature/login_system/sign_up/presntation/sign_up_screen.dart';
import 'package:travenor_app/src/feature/onboarding_screen_view/presentation/onboarding_screen_view.dart';
import 'package:travenor_app/src/feature/splash_screen_view/presentation/splash_screen_view.dart';

class AppRoute {
  static Map<String, WidgetBuilder> get screens => <String, WidgetBuilder>{
        SplashScreenView.routeName: SplashScreenView.builder,
        OnboardingScreenView.routeName: OnboardingScreenView.builder,
        LoginScreenView.routeName: LoginScreenView.builder,
        SignUpScreen.routeName: SignUpScreen.builder,
        ForgotPasswordScreen.routeName: ForgotPasswordScreen.builder,
        OtpVerificationScreen.routeName: OtpVerificationScreen.builder,
      };
}
