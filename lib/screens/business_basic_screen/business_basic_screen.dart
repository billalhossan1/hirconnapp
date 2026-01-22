import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/screens/business_basic_screen/controller/business_basic_controller.dart';
import 'package:hirconn_app/utils/app_log.dart';
import 'package:hirconn_app/widgets/common_checkbox_widget.dart';
import 'package:hirconn_app/widgets/reactive_checkbox_widget.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';
import 'package:hirconn_app/widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

import '../../gen/assets.gen.dart';

class BusinessBasicScreen extends StatelessWidget {
  const BusinessBasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BusinessBasicController controller = Get.find<BusinessBasicController>();
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
                text: 'Business Basic Screen',
                fontSize: 32,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              10.height,
              CommonText(
                text: 'Tell us about the business',
                fontSize: 14,
                isDescription: true,
                textColor: AppColors.instance.dark300,
                textAlign: .start,
              ),
              4.height,
              CommonText(
                text:
                    'This information helps customers find and recognize your business.',
                fontSize: 12,
                textColor: AppColors.instance.subTextColor,
                isDescription: true,
                textAlign: .start,
              ),
              20.height,
              CommonTextField(
                validationType: ValidationType.validateRequired,
                hintText: 'Enter your official business name',
              ),
              10.height,
              CommonText(
                textAlign: .start,
                isDescription: true,
                text:
                    'Does your business operate under a “Doing Business As” (DBA) name?',
                textColor: AppColors.instance.dark300,
                fontSize: 15,
              ),
              10.height,
              ReactiveCheckBox(
                isChecked: () => !controller.isYesSelected.value,
                onChanged: (val) {
                  controller.isYesSelected.value = false;
                },
                text: 'No',
              ),
              4.height,
              ReactiveCheckBox(
                isChecked: () => controller.isYesSelected.value,
                onChanged: (val) {
                  controller.isYesSelected.value = true;
                },
                text: 'Yes',
              ),
              10.height,
              Obx(
                () => controller.isYesSelected.value
                    ? CommonTextField(
                        validationType: ValidationType.validateRequired,
                        hintText: 'Enter your “Doing Business As” (DBA) name',
                      )
                    : SizedBox.shrink(),
              ),
              10.height,
              HeaderText(text: 'Business Category'),
              4.height,
              CommonTextField(

                validationType: ValidationType.validateRequired,
                hintText: 'Select category',
                isReadOnly: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.onTapSelect();
                  },
                  child: CommonText(
                    text: 'Select',
                    // onTap: () {
                    //   controller.onTapSelect();
                    // },
                    borderColor: AppColors.instance.primary,
                    backgroundColor: AppColors.instance.boxBg,
                    textColor: AppColors.instance.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    top: 4,
                    bottom: 4,
                    left: 8,
                    right: 8,
                    enableBorder: true,
                                 borderRadious: 8,

                  ),
                ),
              ),
              4.height,
              HirconnSecondaryText(
                text: 'This helps your business appear in relevant searches',
              ),
              10.height,
              HeaderText(text: 'Location'),
              4.height,
              HirconnSecondaryText(
                text:
                    'This is the primary location where your business operates',
              ),
              10.height,
              CommonTextField(
                borderColor: Colors.transparent,
                validationType: ValidationType.notRequired,
                hintText: 'United States',
                onChanged: (value) {},
                prefixIcon: CommonImage(src: Assets.icons.usa.path),
                isReadOnly: true,
              ),
              6.height,
              CommonStateDropdown(
                countryName: 'United States of America',
                onChanged: (val) {
                  // entity.state = val?.value??'';
                  controller.selectedState.value = val?.value ?? '';
                  appLog('Selected state: ${controller.selectedState.value}');
                },
              ),
              6.height,

              Obx(
                () => CommonCityDropDown(
                  key: Key(controller.selectedState.value),
                  onChange: (val) {
                    // controller.se.city = val ?? '';
                    controller.selectedState.value = val;
                  },
                  selectedState: controller.selectedState.value,
                  selectedCountry: 'United States of America',
                ),
              ),
              10.height,
              HeaderText(text: 'Business Structure'),
              4.height,
              ...List.generate(controller.businessStructureList.length, (
                index,
              ) {
                return Obx(() {
                  // Only reactivity needed is for the checkbox value
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: CommonCheckBox(
                      checkBorderColor: AppColors.instance.dark500,
                      isChecked: controller
                          .businessStructureList[index]
                          .isSelected
                          .value,
                      onChanged: (val) {
                        // Set the selected item and clear others (Radio button-like behavior)
                        // for (var element in controller.businessStructureList) {
                        //   element.isSelected.value = false;
                        // }
                        controller
                                .businessStructureList[index]
                                .isSelected
                                .value =
                            val ?? false;
                      },
                      text: controller.businessStructureList[index].title,
                      textColor:
                          controller
                              .businessStructureList[index]
                              .isSelected
                              .value
                          ? AppColors.instance.primary
                          : AppColors.instance.dark400,
                    ),
                  );
                });
              }),
              10.height,
              HeaderText(text: 'Is your business registered? '),
              HirconnSecondaryText(
                text:
                    'This helps us verify businesses, and built trust. Unregistered business can still join.',
              ),
              6.height,
              ReactiveCheckBox(
                isChecked: () => controller.isBusinessRegistered.value,
                onChanged: (val) {
                  controller.isBusinessRegistered.value = true;
                },
                text: 'Yes, registered',
              ),
              4.height,
              ReactiveCheckBox(
                isChecked: () => !controller.isBusinessRegistered.value,
                onChanged: (val) {
                  controller.isBusinessRegistered.value = false;
                },
                text: 'Not yet',
              ),
              10.height,
              HeaderText(text: 'Engagement Type'),
              4.height,
              ...List.generate(controller.engagementTypeList.length, (index) {
                return Obx(() {
                  // Only reactivity needed is for the checkbox value
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: CommonCheckBox(
                      checkBorderColor: AppColors.instance.dark500,
                      isChecked:
                          controller.engagementTypeList[index].isSelected.value,
                      onChanged: (val) {
                        // Set the selected item and clear others (Radio button-like behavior)
                        // for (var element in controller.businessStructureList) {
                        //   element.isSelected.value = false;
                        // }
                        controller.engagementTypeList[index].isSelected.value =
                            val ?? false;
                      },
                      text: controller.engagementTypeList[index].title,
                      textColor:
                          controller.engagementTypeList[index].isSelected.value
                          ? AppColors.instance.primary
                          : AppColors.instance.dark400,
                    ),
                  );
                });
              }),
              10.height,
              CommonText(
                text: 'Is your business insured?',
                fontSize: 15,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              4.height,
              HirconnSecondaryText(
                text:
                    'Insurance can increase customer confidence, especially for on-site or professional services',
              ),
              6.height,
              ReactiveCheckBox(
                isChecked: () => controller.isBusinessInsured.value == true,
                onChanged: (val) {
                  controller.isBusinessInsured.value = true;
                  controller.isBusinessNotRequired.value = false;
                },
                text: 'Yes',
              ),
              ReactiveCheckBox(
                isChecked: () => controller.isBusinessInsured.value == false,
                onChanged: (val) {
                  controller.isBusinessInsured.value = false;
                  controller.isBusinessNotRequired.value = false;
                },
                text: 'No',
              ),
              ReactiveCheckBox(
                isChecked: () =>
                    controller.isBusinessNotRequired.value ||
                    controller.isBusinessInsured.value == null,
                onChanged: (val) {
                  controller.isBusinessInsured.value = null;
                  controller.isBusinessNotRequired.value = true;
                },
                text: 'Not required',
              ),
              10.height,
              CommonText(
                text: 'Where do you offer your services?',
                fontSize: 15,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              ReactiveCheckBox(
                isChecked: () => controller.isLocationFixed.value == true,
                onChanged: (val) {
                  controller.isLocationFixed.value = true;
                  controller.isOnlineLocation.value = false;
                },
                text: 'At fixed location(s)',
              ),
              ReactiveCheckBox(
                isChecked: () => controller.isLocationFixed.value == false,
                onChanged: (val) {
                  controller.isLocationFixed.value = false;
                  controller.isOnlineLocation.value = false;
                },
                text: 'Nationwide',
              ),
              ReactiveCheckBox(
                isChecked: () =>
                    controller.isOnlineLocation.value ||
                    controller.isLocationFixed.value == null,
                onChanged: (val) {
                  controller.isLocationFixed.value = null;
                  controller.isOnlineLocation.value = true;
                },
                text: 'Online only',
              ),
              10.height,
              CommonMultilineTextField(
                validationType: ValidationType.notRequired,
                hintText:
                    'List all service area (e.g., Bronx, NY, Brooklyn, NY)',
                borderColor: Colors.transparent,
              ),
              10.height,
              CommonText(
                text: 'Does your business have any licenses or certifications?',
                fontSize: 15,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              HirconnSecondaryText(
                text:
                    'Insurance can increase customer confidence, especially for on-site or professional services',
              ),
              6.height,
              ReactiveCheckBox(
                isChecked: () => controller.haveLicense.value == true,
                onChanged: (val) {
                  controller.haveLicense.value = true;
                  controller.isNotRequiredLicense.value = false;
                },
                text: 'Yes, I have relevant licenses/certifications',
              ),
              ReactiveCheckBox(
                isChecked: () => controller.isNotRequiredLicense.value == true,
                onChanged: (val) {
                  controller.isNotRequiredLicense.value = true;
                  controller.haveLicense.value = null;
                },
                text: 'Not required for my business',
              ),
              ReactiveCheckBox(
                isChecked: () => controller.haveLicense.value == false,
                onChanged: (val) {
                  controller.haveLicense.value = false;
                  controller.isNotRequiredLicense.value = false;
                },
                text: 'Not yet',
              ),
              10.height,
              CommonMultilineTextField(
                validationType: ValidationType.notRequired,
                hintText:
                'List all licenses/certifications)',
                borderColor: Colors.transparent,
              ),
              20.height,
              Center(
                child: CommonButton(titleText: 'Next', onTap: () {
                  Get.toNamed(AppRoutes.instance.describeYourBusinessScreen);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
