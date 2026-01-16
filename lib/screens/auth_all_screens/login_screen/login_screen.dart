import 'package:core_kit/button/common_button.dart';
import 'package:core_kit/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/auth_all_screens/login_screen/controller/login_screen_controller.dart';
import 'package:hirconn_app/utils/app_size.dart';
import 'package:hirconn_app/utils/gap.dart';
import '../../../constant/app_assert_icons.dart';
import '../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginScreenController(),
      builder: (controller) {
        return Scaffold(
          body: OnboardingTemplate(
            wave1Color: Color(0xffD8BCE5),
            wave2Color: Color(0xffEADBF1),
            wave3Color: Color(0xffF2E7F6),
            bottomPadding: 200.h,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [

                Gap(height: 10.h),
                CommonText(
                  text: 'Welcome back!',
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.instance.primary,
                ),
                Gap(height: 20.h),
                CommonText(
                  text: 'Let’s get you signed in',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.instance.subTextColor,
                ),
                Gap(height: 10.h),
                CommonButton(
                  buttonWidth: 140.w,
                  titleText: 'SignIn',
                  onTap: () {},
                  icon: SvgPicture.asset(AppAssertIcons.instance.signup),
                  borderColor: AppColors.instance.primary,
                  buttonColor: AppColors.instance.boxBg,
                  titleColor: AppColors.instance.primary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
