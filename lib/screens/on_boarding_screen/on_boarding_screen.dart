import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_assert_icons.dart';
import 'package:hirconn_app/constant/app_assert_image.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/utils/gap.dart';

import '../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnboardingTemplate(
      crossAxisAlignment: CrossAxisAlignment.center,
      isCenterContent: true,
      wave1Color: Color(0xffC9A2DB),
      wave2Color: Color(0xffD8BCE5),
      wave3Color: Color(0xffEADBF1),
      bottomPadding: 200.h,
      child: Column(
        children: [
          CommonImage(
            src: AppAssertImage.instance.logo,
            height: 150.h,
            width: 130.w,
          ),
          Gap(height: 10.h),
          CommonText(
            text: 'Hirconn',
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColors.instance.primary,
          ),
          Gap(height: 20.h),
          CommonText(
            textAlign: TextAlign.center,
            text: 'Connect with people, share updates, and hire\nprofessionals worldwide',
            fontWeight: FontWeight.w600,
            autoResize: false,
            isDescription: false,
            maxLines: 2,
          ),
          Gap(height: 20.h),
          CommonButton(
            buttonWidth: 140.w,
            titleText: 'SignUp',
            onTap: () {
              Get.toNamed(AppRoutes.instance.signUpScreen);
            },
            icon: SvgPicture.asset(AppAssertIcons.instance.signIn),
          ),
          Gap(height: 10.h),
          CommonButton(
            buttonWidth: 140.w,
            titleText: 'SignIn',
            onTap: () {
              Get.toNamed(AppRoutes.instance.loginScreen);
            },
            icon: SvgPicture.asset(AppAssertIcons.instance.signup),
            borderColor: AppColors.instance.primary,
            buttonColor: AppColors.instance.boxBg,
            titleColor: AppColors.instance.primary,
          ),
        ],
      ),
    ),);
  }
}