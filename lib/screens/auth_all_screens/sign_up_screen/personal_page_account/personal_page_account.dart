import 'package:core_kit/core_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/controller/sign_up_controller.dart';
import '../../../../constant/app_colors.dart';
import '../../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart' show OnboardingTemplate;

class PersonalPageAccount extends StatelessWidget {
  const PersonalPageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(

      ),
      backgroundColor: Colors.white,
      body:GetBuilder(
          init: SignUpController(),
          builder: (controller) {
            return OnboardingTemplate(
              wave1Color: Color(0xffD8BCE5),
              wave2Color: Color(0xffEADBF1),
              wave3Color: Color(0xffF2E7F6),
              child: CustomForm(

                builder:(context,formKey)=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Personal Page Account',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      textColor: AppColors.instance.primary,
                    ),
                    10.height,
                    CommonText(
                      text:
                      'Create a Personal Page',
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
                      "This email will be used to sign in, and manage your personal page",
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: AppColors.instance.subTextColor,
                      isDescription: true,
                    ),
                    10.height,
                    CommonTextField(
                      hintText: 'Password',
                      validationType: ValidationType.validatePassword,
                      borderColor: Colors.white,
                    ),
                    10.height,
                    CommonText(
                      text:
                      "Choose a secure password to protect your account",
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: AppColors.instance.subTextColor,
                      isDescription: true,
                    ),
                    40.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ✅ compact + top aligned checkbox (matches screenshot)
                        Obx(
                              () => Padding(
                            padding: const EdgeInsets.only(top: 2), // aligns checkbox with text
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: Checkbox(
                                value: controller.isTermsAccepted.value,
                                onChanged: (value) => controller.isTermsAccepted.value = value ?? false,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                side: const BorderSide(color: Color(0xFFBDBDBD), width: 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 12,
                                height: 1.25,
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(text: 'By continuing, you agree to '),

                                TextSpan(
                                  text: "Hirconn's User Agreement",
                                  style: TextStyle(
                                    color: AppColors.instance.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // open user agreement
                                    },
                                ),

                                const TextSpan(text: ' and '),

                                TextSpan(
                                  text: "Privacy Notice",
                                  style: TextStyle(
                                    color: AppColors.instance.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // open privacy notice
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Center(child: CommonButton(titleText: 'Next', onTap: () {
                      if(formKey.currentState?.validate()??false) {
                        Get.toNamed(AppRoutes.instance.otpVerificationScreen,arguments: controller.emailTextEditingController.text.trim());
                      }
                    })),
                    10.height,
                  ],
                ),
              ),
            );
          }
      )
    );
  }
}
