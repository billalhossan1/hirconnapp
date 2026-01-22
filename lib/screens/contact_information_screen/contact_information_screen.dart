import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/gen/assets.gen.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/screens/contact_information_screen/controller/contact_information_controller.dart';
import 'package:hirconn_app/widgets/common_checkbox_widget.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';
import 'package:hirconn_app/widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

class ContactInformationScreen extends StatelessWidget {
  const ContactInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactInformationController controller =
        Get.find<ContactInformationController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                text: 'Contact Information',
                fontSize: 32,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              6.height,
              CommonText(
                text: 'How can people reach you?',
                fontSize: 12,
                textColor: AppColors.instance.subTextColor,
                isDescription: true,
                textAlign: .start,
              ),
              10.height,
              HeaderText(text: 'Business contact email'),
              4.height,
              CommonTextField(
                validationType: ValidationType.validateEmail,
                hintText: 'contact@yourbusiness.com',
              ),
              10.height,
              Obx(
                () => CommonCheckBox(
                  isChecked: controller.isPublicViewForEmail.value,
                  onChanged: (val) {
                    controller.isPublicViewForEmail.value = val;
                  },
                  text: 'Visible in public view',
                  textSize: 12,
                ),
              ),
              6.height,
              HirconnSecondaryText(
                text: 'This email may be used for customer inquiries',
                fontSize: 12,
              ),
              10.height,
              HirconnHeaderText(
                title: 'Business phone number (optional)',
                fontSize: 15,
              ),
              4.height,
              CommonTextField(
                validationType: ValidationType.validatePhone,
                prefixIcon: SizedBox(
                  width: 60.w,
                  child: Row(
                    children: [
                      CommonImage(src: Assets.svg.usa),
                      4.width,
                      CommonText(text: '+1', fontSize: 14),
                    ],
                  ),
                ),
                hintText: ' (555) 555-5555',
              ),
              // CommonPhoneNumberTextFiled(countryChange: (val){}, textInputAction: TextInputAction.next,
              //   hintText: ' (555) 555-5555',
              //   enablePicker: false,
              //   initalCountryCode: 'US',
              //   borderColor: Colors.transparent,
              //   backgroundColor: AppColors.instance.boxBg,
              // ),
              10.height,
              Obx(
                () => CommonCheckBox(
                  isChecked: controller.isPublicViewForPhone.value,
                  onChanged: (val) {
                    controller.isPublicViewForPhone.value = val;
                  },
                  text: 'Visible in public view',
                  textSize: 12,
                ),
              ),
              10.height,
              HirconnSecondaryText(
                text:
                    'Adding a phone number can increase customer trust, and response speed',
                fontSize: 12,
              ),
              10.height,
              HirconnHeaderText(
                title: 'Preferred contact method',
                fontSize: 14,
              ),
              20.height,
              Obx(()=>CommonCheckBox(isChecked: controller.isPreferredEmail.value, onChanged: (val){
                controller.isPreferredEmail.value = val;
              }, text: 'Email', textSize: 14,textColor: controller.isPreferredEmail.value?AppColors.instance.primary:AppColors.instance.subTextColor),),
              10.height,
              Obx(()=>CommonCheckBox(isChecked: !controller.isPreferredEmail.value, onChanged: (val){
                controller.isPreferredEmail.value = !val;

              }, text: 'Phone', textSize: 14,textColor: controller.isPreferredEmail.value?AppColors.instance.subTextColor:AppColors.instance.primary,),),
              20.height,
              Center(
                child: CommonButton(titleText: 'Next', onTap: () {
                  Get.toNamed(AppRoutes.instance.businessHoursScreen);
                }),
              ),
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
