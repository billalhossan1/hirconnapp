import 'package:core_kit/app_bar/common_app_bar.dart';
import 'package:core_kit/button/common_button.dart';
import 'package:core_kit/text/common_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/auth_all_screens/otp_verification_screen/controller/otp_related_function.dart';
import 'package:hirconn_app/screens/auth_all_screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:hirconn_app/utils/app_size.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OtpVerificationController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonAppBar(),
            body: OnboardingTemplate(
              wave1Color: Color(0xffD8BCE5),
              wave2Color: Color(0xffEADBF1),
              wave3Color: Color(0xffF2E7F6),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Confirm your email',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      textColor: AppColors.instance.primary,
                    ),
                    10.height,
                    CommonText(
                      text:
                      'We sent a verification code to your email address',
                      fontSize: 18,
                      textAlign: TextAlign.start,
                      textColor: AppColors.instance.subTextColor,
                      isDescription: true,
                    ),
                    20.height,

                    CommonText(
                      text:
                      'Enter the code to continue',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: AppColors.instance.subTextColor,
                      isDescription: true,
                    ),
                    PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      length: 6,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the OTP';
                        } else if (value.length < 6) {
                          return 'OTP must be 6 digits';
                        }
                        return null;
                      },
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(20),
                        fieldHeight: 50.w,
                        fieldWidth: 50.w,
                        activeFillColor:  Color(0xffF1E7F6),
                        inactiveFillColor:
                        Color(0xffF7F7F7),
                        selectedFillColor:
                        Color(0xffF1E7F6),
                        activeColor: AppColors.instance.primary,
                        inactiveColor:AppColors.instance.primary,
                        selectedColor: AppColors.instance.primary.withAlpha(80),
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      appContext: context,
                    ),
                    10.height,
                    Center(
                      child: CommonText(
                        text:
                        "Didn’t see it? Check your Spam or Junk folder",
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        textColor: AppColors.instance.subTextColor,
                        isDescription: true,
                      ),
                    ),
                    40.height,
                    Center(child: CommonButton(titleText: 'Confirm', onTap: () {

                      controller.checkOtpFunction();
                    })),
                    10.height,
                    Center(
                      child: Obx(
                            () => RichText(
                          text: TextSpan(
                            text: "Resend in ${OtpRelatedFunction().formatSecondFunction(controller.secondsRemaining.value)} ",
                            style: TextStyle(color: AppColors.instance.primary, fontSize: 14),
                            children: [
                              TextSpan(
                                text:  controller.secondsRemaining.value <= 0 ?"Resend":'',
                                style: TextStyle(color: controller.secondsRemaining.value > 0 ? AppColors.instance.dark400 : AppColors.instance.primary),
                                recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.reSendOtp();
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    10.height,
                    InkWell(onTap: (){
                      Navigator.pop(context);
                    },child: Center(child: CommonText(text: 'Change email address',fontWeight: FontWeight.w600,fontSize: 16,textColor: AppColors.instance.primary,)))
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
