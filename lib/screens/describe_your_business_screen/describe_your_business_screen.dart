import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/screens/describe_your_business_screen/controller/describe_your_business_controller.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';
import 'package:hirconn_app/widgets/on_boarding_template_widget/on_boarding_template_widget.dart';


class DescribeYourBusinessScreen extends StatelessWidget {
  const DescribeYourBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DescribeYourBusinessController controller =
        Get.find<DescribeYourBusinessController>();
    return Scaffold(
      appBar: CommonAppBar(),
      body: OnboardingTemplate(
        wave1Color: Color(0xffD8BCE5),
        wave2Color: Color(0xffEADBF1),
        wave3Color: Color(0xffF2E7F6),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CommonText(
                text: 'Describe your business',
                fontSize: 32,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              6.height,
              CommonText(
                text:
                    'A clear description helps people understand what you offer',
                fontSize: 12,
                textColor: AppColors.instance.subTextColor,
                isDescription: true,
                textAlign: .start,
              ),
              10.height,
              HeaderText(text: 'Business Summary'),
              4.height,
              CommonText(
                text: 'About your business',
                textColor: AppColors.instance.subTextColor,
                fontSize: 12,
              ),
              CommonMultilineTextField(
                validationType: ValidationType.notRequired,
                hintText:
                    "Briefly describe what your business does, and what customers can expect.E.g., We help [type of customer] with [main service or problem] by offering [key solution or benefit]",
                maxLength: 150,
                minLength: 20,
                height: 250,
                borderColor: Colors.transparent,
              ),

              10.height,

              HeaderText(text: 'Services Provided'),
              4.height,
              CommonMultilineTextField(
                validationType: ValidationType.notRequired,
                hintText:
                "Specific services provided",
                maxLength: 500,

                height: 250,
                borderColor: Colors.transparent,
              ),
              HirconnHeaderText(title: 'Business Size',fontSize: 15,fontWeight: FontWeight.w600,),
              4.height,
              CommonDropDown(hint: 'choose business size', items: [
                'Solo',
                '2-10 employees',
                '11-50 employees',
                '51-200 employees',
                '201-500 employees',
                '501-1000 employees',
                '1000+ employees',
              ], onChanged: (val){

              }, nameBuilder: (val) => val,),

              10.height,
            HirconnHeaderText(title: 'Website (optional) ',fontSize: 15,fontWeight: FontWeight.w600,),
              6.height,
              CommonTextField(validationType: ValidationType.notRequired,
                hintText: 'www.yourbusiness.com',
                borderColor: Colors.transparent,
              ),
              HirconnSecondaryText(
                text:
                'Adding a website helps customers verify, and trust your business',fontSize: 12,
              ),
              20.height,
              Center(child: CommonButton(titleText: 'Next', onTap: () {
                Get.toNamed(AppRoutes.instance.contactInformationScreen);
              })),
              60.height
            ],
          ),
        ),
      ),
    );
  }
}
