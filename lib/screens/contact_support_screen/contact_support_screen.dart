import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';
import 'package:hirconn_app/widgets/on_boarding_template_widget/on_boarding_template_widget.dart';
import 'controller/contact_support_controller.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactSupportController controller =
        Get.find<ContactSupportController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                text: 'Contact Support',
                fontSize: 28,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              6.height,
              CommonText(
                text:
                    'For faster help, describe your issue once in a single message. Our support team will reply by email',
                fontSize: 12,
                textColor: AppColors.instance.subTextColor,
                isDescription: true,
                textAlign: .start,
              ),
              10.height,
              HeaderText(text: 'Email Address'),

              4.height,
              HirconnSecondaryText(
                text:
                    "We’ll use this email to reply to your message. Make sure it’s correct",
              ),
              4.height,
              CommonTextField(
                validationType: ValidationType.validateEmail,
                hintText: 'name@example.com',
              ),
              10.height,
              HeaderText(text: 'Issue Type'),
              4.height,
              HirconnSecondaryText(
                text: "Select the option that best describes your issue",
              ),
              4.height,
              CommonDropDown(
                hint: 'Select issues type',
                items: [
                  'Account Issues',
                  'Billing and Payments',
                  'Technical Support',
                  'Feature Requests',
                  'Other',
                ],
                onChanged: (val) {},
                nameBuilder: (val) => val,
              ),
              10.height,

              10.height,
              HeaderText(text: 'Message '),
              4.height,
              HirconnSecondaryText(
                text:
                    'Include any error message, code, or the step where the issue occurred',
              ),
              4.height,
              CommonMultilineTextField(
                validationType: ValidationType.validateRequired,
                hintText:
                    'Describe the issue you’re experiencing… For example: “I didn’t receive my verification code after signing up',
                borderColor: Colors.transparent,
                maxLength: 500,
                height: 150,
              ),
              // CommonPhoneNumberTextFiled(countryChange: (val){}, textInputAction: TextInputAction.next,
              //   hintText: ' (555) 555-5555',
              //   enablePicker: false,
              //   initalCountryCode: 'US',
              //   borderColor: Colors.transparent,
              //   backgroundColor: AppColors.instance.boxBg,
              // ),
              20.height,
              Center(
                child: CommonButton(
                  titleText: 'Contact Support',
                  onTap: () {

                  },
                ),
              ),
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
