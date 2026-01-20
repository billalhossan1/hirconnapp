import 'package:core_kit/core_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/about_screen/controller/about_screen_controller.dart';
import 'package:hirconn_app/widgets/inputs/interest_selection_layout.dart';

import '../../widgets/hirconn_app_widget/hirconn_app_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AboutScreenController controller = Get.find<AboutScreenController>();
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              HirconnHeaderText(title: 'About'),
              6.height,
              HirconnSecondaryText(
                text: 'This helps others understand who you are',
              ),
              10.height,
              CommonMultilineTextField(
                validationType: ValidationType.notRequired,
                hintText:
                    "A short bio about who you are, what you do, or what you're here for",
                maxLength: 150,
                borderColor: Colors.white,
                height: 200,
              ),
              10.height,
          
              HirconnHeaderText(title: 'Work'),
              6.height,
              HirconnSecondaryText(text: 'Your role, profession, or business'),
              10.height,
              CommonMultilineTextField(
                validationType: ValidationType.notRequired,
                hintText: "(e.g., Designer, Consultant)",
                borderColor: Colors.white,
                height: 68,
                maxLength: 10,
              ),
              10.height,
              HirconnHeaderText(title: 'Interests'),
              6.height,
              HirconnSecondaryText(
                text:
                    "Used to show shared interests, and improve matches. Select up to 5 interests",
              ),
              10.height,
              CommonDropDown(
                hint: 'Select your interests',
                items: controller.interestList,
                onChanged: (val) {
                  if (val != null) {
                    controller.addInterest(val);
                  }
                },
                nameBuilder: (item) {
                  return item.toString();
                },
              ),
              12.height,
          
              // Selected Interests Display (Reusable Widget)
                 Obx(()=>  InterestSelectionLayout(
           selectedInterests: controller.selectedInterests.value,
           onRemove: (interest) => controller.removeInterest(interest),
                 ),),
          
              20.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                      ), // aligns checkbox with text
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: Checkbox(
                          value: controller.isTermsAccepted.value,
                          onChanged: (value) =>
                              controller.isTermsAccepted.value = value ?? false,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          side: const BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  const SizedBox(width: 8),
          
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.25,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: 'By completing sign-up, you agree to the ',
                          ),
          
                          TextSpan(
                            text: "Hirconn's User Agreement",
                            style: TextStyle(
                              color: AppColors.instance.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // open user agreement
                              },
                          ),
          
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              color: AppColors.instance.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // open privacy notice
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              30.height,
              Center(
                child: CommonButton(
                  onTap: () {
                    // Navigate to next or submit
                  },
                  titleText: 'Next',
                ),
              ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}

