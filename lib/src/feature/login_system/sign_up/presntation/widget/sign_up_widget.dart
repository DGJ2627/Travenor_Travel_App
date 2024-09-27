import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../utils/helper/size_helper/size_helper.dart';
import '../../../../../utils/texts/default_app_texts.dart';
import '../../../../../utils/validator/email_password_validator/email_password_validator .dart';
import '../../../../../utils/widget/buttons/custom_tap_button.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = SizeHelper.sizeHelper.screenWidth(context);
    final height = SizeHelper.sizeHelper.screenHeight(context);
    final email = TextEditingController();
    final password = TextEditingController();
    return Form(
      key: EmailAndPasswordValidator.validator.globalKeySignUp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //login form

          TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            validator: (value) =>
                EmailAndPasswordValidator.validator.validateUserName(value),
            decoration: const InputDecoration(
              labelText: "Name",
            ),
          ),
          const Gap(20),
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
            child: Text(
              DefaultAppTexts.defaultAppTexts.forgotPassword,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Gap(20),

          //sign up btn
          CustomTapButton(
            btnHeight: height * 0.062,
            btnWidth: width * 0.86,
            btnName: DefaultAppTexts.defaultAppTexts.signUpBtn,
            onTap: () {
              if (EmailAndPasswordValidator
                  .validator.globalKeySignUp.currentState!
                  .validate()) {
                log("Sign Up Done");
              }
            },
          ),
        ],
      ),
    );
  }
}
