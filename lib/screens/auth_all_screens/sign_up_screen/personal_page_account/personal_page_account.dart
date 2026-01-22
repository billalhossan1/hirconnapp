import 'package:core_kit/core_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/controller/sign_up_controller.dart';
import '../../../../constant/app_colors.dart';
import '../../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart'
    show OnboardingTemplate;

class PersonalPageAccount extends StatelessWidget {
  const PersonalPageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(),
      backgroundColor: Colors.white,
      body: GetBuilder(
        init: SignUpController(),
        builder: (controller) {
          return OnboardingTemplate(
            wave1Color: Color(0xffD8BCE5),
            wave2Color: Color(0xffEADBF1),
            wave3Color: Color(0xffF2E7F6),
            child: CustomForm(
              builder: (context, formKey) => Column(
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
                    text: 'Create a Personal Page',
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
                    text: "Choose a secure password to protect your account",
                    fontSize: 14,
                    textAlign: TextAlign.start,
                    textColor: AppColors.instance.subTextColor,
                    isDescription: true,
                  ),
                  40.height,
                  Obx(()=>CommonCheckBoxMultiline(
                    isTermsAccepted: controller.termsAndConditions.value,
                    firstSecondaryText: 'By continuing, you agree to ',
                    secondSecondaryText: ' and ',
                    firstMainText: "Hirconn's User Agreement",
                    secondMainText: 'Privacy Notice',
                    onChanged: (value) {
                      controller.termsAndConditions.value = value!;
                    },
                    onTapFirstMainText: () {
                      Get.toNamed(AppRoutes.instance.privacyPolicy);
                    },
                    onTapSecondMainText: () {
                      Get.toNamed(AppRoutes.instance.privacyPolicy);
                    },
                  ),),

                  Center(
                    child: CommonButton(
                      titleText: 'Next',
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          Get.toNamed(
                            AppRoutes.instance.otpVerificationScreen,
                            arguments: {
                              'email': controller
                                  .emailTextEditingController
                                  .text
                                  .trim(),
                              'fromBusiness': false,
                            },
                          );
                        }
                      },
                    ),
                  ),
                  10.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CommonCheckBoxMultiline extends StatelessWidget {
  final bool isTermsAccepted;
  final String firstSecondaryText;
  final String secondSecondaryText;
  final String firstMainText;
  final String secondMainText;
  final ValueChanged<dynamic> onChanged;
  final VoidCallback onTapFirstMainText;
  final VoidCallback onTapSecondMainText;
  const CommonCheckBoxMultiline({
    super.key,
    required this.isTermsAccepted,
    required this.firstSecondaryText,
    required this.secondSecondaryText,
    required this.firstMainText,
    required this.secondMainText,
    required this.onChanged,
    required this.onTapFirstMainText,
    required this.onTapSecondMainText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ compact + top aligned checkbox (matches screenshot)
        Padding(
          padding: const EdgeInsets.only(top: 2), // aligns checkbox with text
          child: SizedBox(
            width: 18,
            height: 18,
            child: Checkbox(
              side: BorderSide(color: AppColors.instance.dark500, width: 1),
              value: isTermsAccepted,
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),

        8.width,

        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 12,
                height: 1.25,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: firstSecondaryText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.instance.dark500,
                  ),
                ),

                TextSpan(
                  text: firstMainText,
                  style: TextStyle(
                    color: AppColors.instance.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      onTapFirstMainText();
                    },
                ),

                TextSpan(
                  text: secondSecondaryText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.instance.dark500,
                  ),
                ),

                TextSpan(
                  text: secondMainText,
                  style: TextStyle(
                    color: AppColors.instance.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // open privacy notice
                      onTapSecondMainText();
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
