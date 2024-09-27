
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travenor_app/src/feature/login_system/login/presntation/login_screen_view/login_screen_cubit.dart';
import 'package:travenor_app/src/feature/login_system/login/presntation/widget/login_form_widget.dart';
import 'package:travenor_app/src/feature/login_system/sign_up/presntation/sign_up_screen.dart';
import 'package:travenor_app/src/utils/helper/size_helper/size_helper.dart';
import 'package:travenor_app/src/utils/texts/default_app_texts.dart';

import '../widget/social_media_icons_widget.dart';

class LoginScreenView extends StatefulWidget {
  static String routeName = "/LoginScreenView";

  const LoginScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: const LoginScreenView(),
    );
  }

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  Widget build(BuildContext context) {
    final width = SizeHelper.sizeHelper.screenWidth(context);
    final height = SizeHelper.sizeHelper.screenHeight(context);

    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GestureDetector(
                // onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  height: height * 0.08,
                  width: width * 0.08,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF7F7F9),
                  ),
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(40),
                  Text(
                    DefaultAppTexts.defaultAppTexts.signInNow,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Gap(10),
                  Text(
                    DefaultAppTexts.defaultAppTexts.pleaseSignIn,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Gap(50),

                  const LoginFormWidget(),

                  const Gap(50),
                  //sing up
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      SignUpScreen.routeName,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: DefaultAppTexts.defaultAppTexts.noHaveAc,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          TextSpan(
                            text: DefaultAppTexts.defaultAppTexts.signUpBtn,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    DefaultAppTexts.defaultAppTexts.orConnect,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const Gap(150),

                  //social media icons
                  const SocialMediaIcons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
