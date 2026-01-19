import 'package:core_kit/core_kit.dart';
import 'package:core_kit/text_field/input_formatters/input_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/gen/assets.gen.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/controller/personal_page_details_controller.dart';
import 'package:hirconn_app/utils/app_log.dart';
import '../../../../constant/app_colors.dart';
import '../../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart' show OnboardingTemplate;

class PersonalPageDetailsScreen extends StatelessWidget {
  const PersonalPageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(

        ),
        backgroundColor: Colors.white,
        body:GetBuilder(
            init: PersonalPageDetailsController(),
            builder: (controller) {
              return OnboardingTemplate(
                wave1Color: Color(0xffD8BCE5),
                wave2Color: Color(0xffEADBF1),
                wave3Color: Color(0xffF2E7F6),
                child: CustomForm(

                  builder:(context,formKey)=> Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: 'Personal Page Details',
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        textColor: AppColors.instance.primary,
                      ),
                      10.height,
                      CommonText(
                        text:
                        'Set up your personal profile to connect with people, and discover businesses nearby',
                        fontSize: 14,
                        textAlign: TextAlign.start,
                        textColor: AppColors.instance.subTextColor,
                        isDescription: true,
                      ),
                      30.height,
                      
                      HeaderTextFiled(text: 'Date of Birth ',),
                      _ageReaderWidget(controller),
                      // 10.height,
                      // RichText(text: TextSpan(
                      //   children: [
                      //     TextSpan(
                      //       text: 'You must be ',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: AppColors.instance.subTextColor,
                      //       ),
                      //     ),
                      //     TextSpan(
                      //       text: '18 years old',
                      //       style: TextStyle(
                      //           fontSize: 14,
                      //           color: Colors.grey,
                      //           fontWeight: FontWeight.bold
                      //       ),
                      //     ),
                      //     TextSpan(
                      //       text: " to create an account",
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: AppColors.instance.subTextColor,
                      //       ),
                      //
                      //     ),
                      //   ],
                      // ),),
                      6.height,
                      SubTextWidget(text: 'Your age helps show appropriate matches, and can’t be changed later',),
                      20.height,
                      HeaderTextFiled(text: 'Name',),
                      CommonTextField(
                        hintText: 'First Name',
                        validationType: ValidationType.validateUsername,
                        borderColor: Colors.white,
                      ),
                      6.height,
                      SubTextWidget(text: 'Your name is visible to others on your profile.  You can request a change later'),
                      20.height,

                      HeaderTextFiled(text: 'Gender',),
                      CommonDropDown(hint: 'Man, Woman, Non-Binary, Prefer not to say', items: ['Man','Woman','Non-Binary','Prefer not to say'], onChanged: (val){}, nameBuilder: (value){
                        return value;
                      },
                        backgroundColor: AppColors.instance.boxBg,
                        borderColor: Colors.transparent,
                      ),

                      6.height,
                      SubTextWidget(text: 'Used to improve discovery and matching. You can update this later'),
                      20.height,
                      HeaderTextFiled(text: 'Location'),
                      CommonTextField(borderColor: Colors.transparent,validationType: ValidationType.notRequired,hintText: 'United States',prefixIcon: CommonImage(src:Assets.icons.usa.path),isReadOnly: true,),
                   6.height,
                    CommonStateDropdown(countryName: 'United States of America', onChanged: (val){

                       controller.selectedState.value = val?.value??'';
                     },),
                      6.height,

                   Obx(()=>  CommonCityDropDown(key: Key(controller.selectedState.value),onChange: (val){
                     controller.selectedCountry.value = val;
                   }, selectedState:controller.selectedState.value, selectedCountry: 'United States of America'),),
                      40.height,

                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.instance.subTextColor,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Used to show people near you. We use this information to personalize your experience. Learn more in our ',
                                ),

                                TextSpan(
                                  text: "Privacy Notice",
                                  style: TextStyle(
                                    color: AppColors.instance.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                    },
                                ),
                              ],
                            ),
                          ),

                      Center(child: CommonButton(titleText: 'Next', onTap: () {
                        if(formKey.currentState?.validate()??false) {
                          // Get.toNamed(AppRoutes.instance.otpVerificationScreen);
                        }
                      })),
                      10.height,
                    ],
                  ),
                ),
              );
            }
        )
    );
  }

  CommonDateInputTextField _ageReaderWidget(PersonalPageDetailsController controller) {
    return CommonDateInputTextField(
                      // minDate: Utils.subtractYears(DateTime.now(), 140),
                      // maxDate: Utils.subtractYears(DateTime.now(), 18),
                      borderColor: AppColors.instance.transparent,
                      backgroundColor: AppColors.instance.boxBg,
                      isValidationRequired: true,
                      onChanged: (date) {
                        final finalDate = date ?? DateTime.now();
                        AppLogger.debug(finalDate.toString());
                        controller.calculateAge(finalDate);
                      },
                      validation: (value) {
                        final result = InputHelper.validate(ValidationType.validateDate, value);
                        if (result != null) {
                          return result;
                        }

                        if (value != null && value.isNotEmpty) {
                          final date = DateTime.tryParse(value);
                          if (date == null) {
                            return 'Invalid date';
                          }
                          if (!date.isBefore(DateTime.now().subtract(const Duration(days: 18 * 365)))) {
                            return 'You must be at least 18 years old';
                          }
                        }
                        return null;
                      },
                      suffix: SizedBox(
                            child: Obx(()=>CommonText(
                              enableBorder: true,
                              backgroundColor: AppColors.instance.boxBg,
                              top: 1,
                              bottom: 1,
                              left: 5,
                              right: 5,

                              text: '${controller.age.value} Yrs',
                              style: TextStyle(color: controller.age.value <18?Colors.grey:AppColors.instance.primary, fontWeight: FontWeight.bold),
                            ),),
                          ),

                      onSave: (date) {
                      },
                    );
  }
}

class SubTextWidget extends StatelessWidget {
  final String text;
  const SubTextWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CommonText(text: text,fontSize: 14,textColor: AppColors.instance.subTextColor,);
  }
}

class HeaderTextFiled extends StatelessWidget {
  final String text;
  final bool showStar;
  const HeaderTextFiled({
    super.key, required this.text, this.showStar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonText(text: text,textColor: AppColors.instance.primary,fontWeight: FontWeight.w600,fontSize: 14,),
        showStar?CommonText(
          text: '*',
          textColor: Colors.red,
          fontSize: 18,
        ):SizedBox.shrink(),
      ],
    );
  }
}
