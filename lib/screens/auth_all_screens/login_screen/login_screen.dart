import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_kit/core_kit.dart';
import 'package:hirconn_app/constant/app_assert_gif.dart';
import 'package:hirconn_app/constant/app_assert_svg.dart';
import 'package:hirconn_app/gen/assets.gen.dart';

import '../../../constant/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';
import 'controller/login_screen_controller.dart';
import '../../../widgets/account_type_button/account_type_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: CommonAppBar(

          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: OnboardingTemplate(
              waveText: Row(
                children: [
                  CommonText(fontWeight: FontWeight.bold,textColor: AppColors.instance.primary,text: 'Privacy Notice',fontSize:12,style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),),
                  CommonText(fontWeight: FontWeight.bold,textColor: AppColors.instance.primary,text: ' & ',fontSize: 12,),
                  CommonText(fontWeight: FontWeight.bold,textColor: AppColors.instance.primary,fontSize: 12,text: 'User Agreement',style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),),
                ],
              ),
              wave1Color: Color(0xffD8BCE5),
              wave2Color: Color(0xffEADBF1),
              wave3Color: Color(0xffF2E7F6),
              bottomPadding: 200,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Welcome back text
                    CommonText(
                      text: 'Welcome back!',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      textColor: AppColors.instance.primary,
                    ),

                    8.height,

                    // Subtitle with emoji
                    Row(
                      children: [
                        CommonText(
                          text: 'Let\'s get you signed in ',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.instance.subTextColor,
                        ),
                        CommonImage(src:  AppAssertGif.arrowGif, height: 20, width: 20),
                      ],
                    ),

                    30.height,

                    // Choose your Account type
                    CommonText(
                      text: 'Choose your Account type',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.black,
                    ),

                   12.height,

                    // Account type button
                    AccountTypeButton(
                      selected: controller.selectedAccountType == 'personal',
                      onTap: () => controller.selectAccountType('personal'),
                      iconSvg:Assets.svg.personalPage,
                      label: 'Personal Page',
                    ),

                    24.height,
                    AccountTypeButton(
                      selected: controller.selectedAccountType == 'buisness',
                      onTap: () => controller.selectAccountType('buisness'),
                            iconSvg:Assets.svg.businessPage,
                      label: 'Business Page',
                    ),
                    24.height,
                    // Email Address field
                    CommonTextField(
                      borderColor: Colors.white,
                      validationType: ValidationType.validateEmail,
                      controller: controller.emailTextEditingController,
                      hintText: 'Email Address',
                    ),

                    16.height,

                    // Password field
                    CommonTextField(
                      borderColor: Colors.white,
                      validationType: ValidationType.validatePassword,
                      controller: controller.passwordTextEditingController,
                      hintText: 'Password',
                    ),

                  8.height,
                    // Forget Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                        Get.toNamed(AppRoutes.instance.forgotScreen);
                        },
                        child: CommonText(
                          text: 'Forget Password?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.instance.primary,
                        ),
                      ),
                    ),

                    32.height,

                    // Sign In button
                    Center(
                      child: CommonButton(
                        buttonWidth: 160,
                        titleText: 'Sign In',
                        onTap: () {
                          controller.checkValidation();
                        },
                        buttonColor: AppColors.instance.primary,
                        titleColor: Colors.white,
                      ),
                    ),

                   24.height,

                    // New here? Sign Up
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonText(
                            text: 'New here? ',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            textColor: Colors.grey,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.instance.signUpScreen);
                            },
                            child: CommonText(
                              text: 'Sign Up',
                              fontSize: 14.sp,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.instance.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                  60.height,

                    // Privacy Notice & User Agreement

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
