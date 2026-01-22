import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../widgets/account_type_button/account_type_button.dart';
import '../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';
import 'controller/sign_up_controller.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(

      ),
      backgroundColor: Colors.white,
      body: GetBuilder(
        init: SignUpController(),
        builder: (controller) {
          return SafeArea(
            child: OnboardingTemplate(
              wave1Color: Color(0xffD8BCE5),
              wave2Color: Color(0xffEADBF1),
              wave3Color: Color(0xffF2E7F6),
              bottomPadding: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Welcome back text
                  CommonText(
                    text: 'Create Account',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.instance.primary,
                  ),

                  8.height,

                  // Subtitle with emoji
                  Row(
                    children: [
                      CommonText(
                        text: 'Choose how you want to use ',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.instance.subTextColor,
                      ),
                      CommonText(
                        text: 'Hirconn',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.instance.primary,
                      ),

                    ],
                  ),



                  12.height,

                  // Account type button
                  AccountTypeButton(
                    selected: controller.selectedAccountType == 'buisness',
                    onTap: () => controller.selectAccountType('buisness'),
                    iconSvg:Assets.svg.businessPage,
                    label: 'Business Page',
                  ),

                  CommonText(
                    text: 'For brands, services, and organizations',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.instance.subTextColor,
                  ),
                  18.height,
                  AccountTypeButton(
                    selected: controller.selectedAccountType == 'personal',
                    onTap: () => controller.selectAccountType('personal'),
                    iconSvg:Assets.svg.personalPage,
                    label: 'Personal Page',
                  ),
                  CommonText(
                    text: 'For individuals, and personal use',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.instance.subTextColor,
                  ),
                  50.height,

                  // Sign In button
                  Center(
                    child: CommonButton(
                      buttonWidth: 160,
                      titleText: 'Next',
                      onTap: () {
                        controller.checkValidation();
                      },
                      buttonColor: AppColors.instance.primary,
                      titleColor: Colors.white,
                    ),
                  ),


                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
