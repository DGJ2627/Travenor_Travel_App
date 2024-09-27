import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travenor_app/src/config/route/app_route.dart';
import 'package:travenor_app/src/feature/login_system/forgot_password/presntatiion/forgot_password_cubit.dart';
import 'package:travenor_app/src/feature/login_system/login/presntation/login_screen_view/login_screen_cubit.dart';
import 'package:travenor_app/src/feature/login_system/sign_up/presntation/sign_up_cubit.dart';
import 'package:travenor_app/src/feature/onboarding_screen_view/presentation/onboarding_screen_cubit.dart';
import 'package:travenor_app/src/feature/splash_screen_view/presentation/splash_screen_cubit.dart';
import 'package:travenor_app/src/feature/splash_screen_view/presentation/splash_screen_view.dart';
import 'package:travenor_app/src/utils/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashScreenCubit(),
        ),
        BlocProvider(
          create: (context) => OnboardingScreenCubit(),
        ),
        BlocProvider(
          create: (context) => LoginScreenCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreenView.routeName,
        routes: AppRoute.screens,
        theme: AppTheme.appTheme.defaultTheme,
      ),
    );
  }
}
