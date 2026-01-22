import 'package:core_kit/core_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/screens/auth_all_screens/forgot_screen/controller/forgot_screen_controller.dart';
import 'package:hirconn_app/utils/app_log.dart';

import '../../../../constant/app_colors.dart';
import '../../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

class ForgotEmailInputScreen extends StatelessWidget {
  const ForgotEmailInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForgotScreenController(),
      builder: (controller) {
        return OnboardingTemplate(
          bottomPadding: 20,

          wave1Color: Color(0xffD8BCE5),
          wave2Color: Color(0xffEADBF1),
          wave3Color: Color(0xffF2E7F6),
          child: CustomForm(
            builder: (context, formKey) => ConstrainedBox(
              constraints: BoxConstraints(minHeight: context.height - 180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textColor: AppColors.instance.subTextColor,
                        isDescription: true,
                      ),
                      40.height,
                      Center(
                        child: CommonButton(
                          titleText: 'Send Code',
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              controller.checkEmailFunction();
                            }
                          },
                        ),
                      ),
                      10.height,
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "Back to ",
                              fontSize: 14,
                              textAlign: TextAlign.start,
                              textColor: AppColors.instance.subTextColor,
                              isDescription: true,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CommonText(
                                text: "Sign In",
                                fontSize: 14,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.instance.primary,
                                isDescription: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Need help? ",
                        style: TextStyle(
                          color: AppColors.instance.dark500,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Contact Support',
                            style: TextStyle(
                              color: AppColors.instance.primary,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                appLog("Contact Support Clicked");
                                Get.toNamed(
                                  AppRoutes.instance.contactSupportScreen,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
