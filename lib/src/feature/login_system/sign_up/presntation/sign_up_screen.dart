import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travenor_app/src/feature/login_system/login/presntation/login_screen_view/login_screen_view.dart';
import 'package:travenor_app/src/feature/login_system/sign_up/presntation/sign_up_cubit.dart';
import 'package:travenor_app/src/feature/login_system/sign_up/presntation/widget/sign_up_widget.dart';

import '../../../../utils/helper/size_helper/size_helper.dart';
import '../../../../utils/texts/default_app_texts.dart';
import '../../login/presntation/widget/social_media_icons_widget.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/SignUpScreen";
  const SignUpScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = SizeHelper.sizeHelper.screenWidth(context);
    final height = SizeHelper.sizeHelper.screenHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(40),
                Text(
                  DefaultAppTexts.defaultAppTexts.signUpNow,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Gap(10),
                Text(
                  DefaultAppTexts.defaultAppTexts.pleaseSignUp,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Gap(30),
                const SignUpWidget(),
                const Gap(40),

                //sing up
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    LoginScreenView.routeName,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: DefaultAppTexts.defaultAppTexts.haveAc,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        TextSpan(
                          text: DefaultAppTexts.defaultAppTexts.signInBtn,
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
                const Gap(80),

                //social media icons
                const SocialMediaIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
