import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:travenor_app/src/feature/login_system/otp_verification_screen/persntation/otp_verification_cubit.dart';
import '../../../../utils/helper/size_helper/size_helper.dart';
import '../../../../utils/texts/default_app_texts.dart';
import '../../../../utils/widget/buttons/custom_tap_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  static String routeName = "/OtpVerificationScreen";

  const OtpVerificationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpVerificationCubit(),
      child: const OtpVerificationScreen(),
    );
  }

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OtpVerificationCubit>().startTime();
  }

  @override
  Widget build(BuildContext context) {
    final width = SizeHelper.sizeHelper.screenWidth(context);
    final height = SizeHelper.sizeHelper.screenHeight(context);
    OtpFieldController otpController = OtpFieldController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(40),
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  DefaultAppTexts.defaultAppTexts.otpVerification,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const Gap(20),
              Text(
                DefaultAppTexts.defaultAppTexts.otpVerificationTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Gap(50),
              Text(
                DefaultAppTexts.defaultAppTexts.otpVerificationCode,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Gap(50),

              //otp text field
              OTPTextField(
                length: 4,
                controller: otpController,
                keyboardType: TextInputType.number,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldWidth: 70,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: const Color(0xffF7F7F9),
                  borderColor: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  disabledBorderColor: Colors.transparent,
                ),
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
              ),
              const Gap(50),

              //verify btn
              CustomTapButton(
                btnHeight: 56,
                btnWidth: width,
                btnName: DefaultAppTexts.defaultAppTexts.otpVerificationBtn,
                onTap: () {},
              ),
              const Gap(20),

              //otp second
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DefaultAppTexts.defaultAppTexts.otpVerificationResend,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
                      builder: (context, state) {
                        if (state is OtpVerificationSendCode) {
                          return Text(
                            '00:${state.timerValue.toString().padLeft(2, '0')}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          );
                        } else if (state is OtpVerificationExpired) {
                          return Text(
                            'Time expired',
                            style: Theme.of(context).textTheme.headlineSmall,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
