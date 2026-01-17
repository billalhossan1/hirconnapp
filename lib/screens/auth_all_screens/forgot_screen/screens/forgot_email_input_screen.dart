import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';
import '../../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

class ForgotEmailInputScreen extends StatelessWidget {
  const ForgotEmailInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      wave1Color: Color(0xffD8BCE5),
      wave2Color: Color(0xffEADBF1),
      wave3Color: Color(0xffF2E7F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Forgot Password?',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            textColor: AppColors.instance.primary,
          ),
          10.height,
          CommonText(
            text:
                'Enter your email address to receive a secure password reset code',
            fontSize: 18,
            textAlign: TextAlign.start,
            textColor: AppColors.instance.subTextColor,
            isDescription: true,
          ),
          30.height,
          CommonTextField(
            hintText: 'Email Address',
            validationType: ValidationType.validateEmail,
            borderColor: Colors.white,
          ),
          10.height,
          CommonText(
            text:
            "If an account exists, you'll receive a reset code shortly",
            fontSize: 14,
            textAlign: TextAlign.start,
            textColor: AppColors.instance.subTextColor,
            isDescription: true,
          ),
          40.height,
          Center(child: CommonButton(titleText: 'Send Code', onTap: () {})),
          10.height,
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text:
                  "Back to ",
                  fontSize: 14,
                  textAlign: TextAlign.start,
                  textColor: AppColors.instance.subTextColor,
                  isDescription: true,
                ),CommonText(
                  text:
                  "Sign In",
                  fontSize: 14,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.instance.primary,
                  isDescription: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
