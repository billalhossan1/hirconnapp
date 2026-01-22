import 'package:core_kit/core_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_account/personal_page_account.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/screens/business_representive_screen/controller/business_representative_controller.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';
import 'package:hirconn_app/widgets/on_boarding_template_widget/on_boarding_template_widget.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_checkbox_widget.dart';

class BusinessRepresentativeScreen extends StatelessWidget {
  const BusinessRepresentativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BusinessRepresentativeController controller =
        Get.find<BusinessRepresentativeController>();
    return Scaffold(
      appBar: CommonAppBar(),
      body: SafeArea(
        child: OnboardingTemplate(
          wave1Color: Color(0xffD8BCE5),
          wave2Color: Color(0xffEADBF1),
          wave3Color: Color(0xffF2E7F6),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CommonText(
                text: 'Business Representative',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                textColor: AppColors.instance.primary,
              ),
              10.height,
              HirconnSecondaryText(text: 'Create a Business Page'),
              20.height,
              CommonTextField(
                validationType: ValidationType.validateUsername,
                hintText: 'Full Name',
                borderColor: Colors.white,
              ),
              10.height,
              CommonTextField(
                validationType: ValidationType.validateEmail,
                hintText: 'Email address [you@company.com]',
                borderColor: Colors.white,
              ),
              4.height,
              HirconnSecondaryText(
                text: 'This email will be used to manage this Business Page.',
              ),
              10.height,
              CommonTextField(
                validationType: ValidationType.validatePassword,
                hintText: 'Password',
                borderColor: Colors.white,
              ),
              4.height,
              HirconnSecondaryText(
                text:
                'Choose a secure password to protect your account',
              ),
              20.height,
              HeaderText(text: 'Authority Confirmation'),
              4.height,
              HirconnSecondaryText(
                text:
                'Do you have the permission to create and manage this business page?',
              ),
              10.height,
              Obx(
                    () => CommonCheckBox(
                      checkBorderColor: AppColors.instance.dark500,
                  isChecked: controller.isTermsAccepted.value,
                  onChanged: (value) {
                    controller.isTermsAccepted.value = value!;
                  },
                  text: 'Yes, I am authorized',
                ),
              ),
              10.height,
              HirconnSecondaryText(
                text:
                'By continuing, you confirm that you have permission to represent this business on this platform.',
              ),
              20.height,
              HeaderText(text: 'Age Confirmation'),
              Obx(
                    () => CommonCheckBox(
                      checkBorderColor: AppColors.instance.dark500,
                  isChecked: controller.ageConfirmation.value,
                  onChanged: (value) {
                    controller.ageConfirmation.value = value!;
                  },
                  text: 'I confirm that I am at least 18 years old',
                ),
              ),
              20.height,
              Obx(
                    () => CommonCheckBoxMultiline(
                  isTermsAccepted: controller.privacy.value,
                  firstSecondaryText: 'By continuing, you agree to ',
                  secondSecondaryText: ' and ',
                  firstMainText: "Hirconn's User Agreement,",
                  secondMainText: "Privacy Notice",
                  onChanged: (value) {
                    controller.privacy.value = value!;
                  },
                  onTapFirstMainText: () {
                    Get.toNamed(AppRoutes.instance.privacyPolicy);
                  },
                  onTapSecondMainText: () {
                    Get.toNamed(AppRoutes.instance.privacyPolicy);
                  },
                ),
              ),
              30.height,
              Center(
                child: CommonButton(titleText: 'Next', onTap: () {
                  Get.toNamed(AppRoutes.instance.otpVerificationScreen,arguments: {'fromBusiness':true});
                }),
              ),
              20.height,
              _alreadyHaveAccount(),
              20.height,
              Center(
                child: RichText(text: TextSpan(
                  text: 'Privacy Notice',

                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(AppRoutes.instance.privacyPolicy);
                    },
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.instance.primary,
                    decoration: TextDecoration.underline,

                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' & ',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.instance.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'User Agreement',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.instance.primary,
                        decoration: TextDecoration.underline,

                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.instance.privacyPolicy);
                        },
                    ),
                  ],
                )),
              )

            ],
          ),
        ),
      ),
    );
  }

  Center _alreadyHaveAccount() {
    return Center(
              child: RichText(text: TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.instance.primary,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAllNamed(AppRoutes.instance.loginScreen);
                      },
                  ),
                ],
              )),
            );
  }
}

