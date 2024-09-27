import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:travenor_app/src/feature/login_system/forgot_password/presntatiion/forgot_password_screen.dart';
import '../../../../../utils/helper/size_helper/size_helper.dart';
import '../../../../../utils/texts/default_app_texts.dart';
import '../../../../../utils/validator/email_password_validator/email_password_validator .dart';
import '../../../../../utils/widget/buttons/custom_tap_button.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = SizeHelper.sizeHelper.screenWidth(context);
    final height = SizeHelper.sizeHelper.screenHeight(context);
    final email = TextEditingController();
    final password = TextEditingController();
    return Form(
      autovalidateMode: AutovalidateMode.onUnfocus,
      key: EmailAndPasswordValidator.validator.globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //login form

          TextFormField(
            validator: (value) =>
                EmailAndPasswordValidator.validator.validateEmail(value),
            decoration: const InputDecoration(labelText: "Email"),
          ),
          const Gap(20),
          TextFormField(
            validator: (value) =>
                EmailAndPasswordValidator.validator.validatePassword(value),
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.eye)),
              labelText: "Password",
            ),
          ),
          const Gap(20),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
              child: Text(
                DefaultAppTexts.defaultAppTexts.forgotPassword,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const Gap(20),

          //sign in btn
          CustomTapButton(
            btnHeight: 56,
            btnWidth: width,
            btnName: DefaultAppTexts.defaultAppTexts.signInBtn,
            onTap: () {
              if (EmailAndPasswordValidator.validator.globalKey.currentState!
                  .validate()) {
                log("Sign In Done");
              }
            },
          ),
        ],
      ),
    );
  }
}
