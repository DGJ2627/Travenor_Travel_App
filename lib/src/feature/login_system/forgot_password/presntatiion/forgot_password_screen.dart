import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:travenor_app/src/feature/login_system/forgot_password/presntatiion/forgot_password_cubit.dart';
import 'package:travenor_app/src/feature/login_system/login/presntation/login_screen_view/login_screen_view.dart';
import 'package:travenor_app/src/feature/login_system/otp_verification_screen/persntation/otp_verification_screen.dart';
import 'package:travenor_app/src/utils/constant/imagepath_constant/imagepath_constant.dart';
import '../../../../utils/helper/size_helper/size_helper.dart';
import '../../../../utils/texts/default_app_texts.dart';
import '../../../../utils/validator/email_password_validator/email_password_validator .dart';
import '../../../../utils/widget/buttons/custom_tap_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/ForgotPasswordScreen";
  const ForgotPasswordScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: const ForgotPasswordScreen(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(40),
              Text(
                DefaultAppTexts.defaultAppTexts.forgotPass,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Gap(10),
              Text(
                DefaultAppTexts.defaultAppTexts.forgotPassTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Gap(50),
              TextFormField(
                validator: (value) =>
                    EmailAndPasswordValidator.validator.validatePassword(value),
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              const Gap(50),
              CustomTapButton(
                btnHeight: 56,
                btnWidth: width,
                btnName: DefaultAppTexts.defaultAppTexts.forgotBtn,
                onTap: () {
                  // if (EmailAndPasswordValidator
                  //     .validator.globalKey.currentState!
                  //     .validate()) {
                  //   log("Forgot Password");
                  // }
                  openEmailBox(context);
                },
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

void openEmailBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () {
          if (context.mounted) {
            Navigator.pop(context);
          }
          Navigator.pushNamed(context, OtpVerificationScreen.routeName);
        },
        child: AlertDialog(
          content: SizedBox(
            height: 196,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 44,
                  width: 44,
                  child: SvgPicture.asset(
                      ImagePath.imagePath.forgotPasswordEmailIcon),
                ),
                const Gap(30),
                Text(
                  DefaultAppTexts.defaultAppTexts.checkEmail,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Gap(20),
                Text(
                  DefaultAppTexts.defaultAppTexts.checkEmailTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
