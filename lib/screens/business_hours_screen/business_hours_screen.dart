import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/screens/business_hours_screen/controller/business_hours_controller.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';
import 'package:hirconn_app/widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

import '../../widgets/date_time_picker_widget/date_time_picker_widget.dart';

class BusinessHoursScreen extends StatelessWidget {
  const BusinessHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BusinessHoursController controller =
    Get.find<BusinessHoursController>();
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
                text: 'Business hours',
                fontSize: 32,
                textColor: AppColors.instance.primary,
                fontWeight: FontWeight.w600,
              ),
              HirconnSecondaryText(text: 'Let people know when you’re available'),
              10.height,
              HeaderText(text: 'Open Days & Hours'),
              HirconnSecondaryText(text: 'These hours will be visible in public view',fontSize: 12,),
              10.height,
              DayTimePickerWidget(
                dayName: 'Sunday',
                isSelected: controller.isSundaySelected,
                fromTime: controller.sundayFrom,
                toTime: controller.sundayTo,
              ),
              DayTimePickerWidget(
                dayName: 'Monday',
                isSelected: controller.isMondaySelected,
                fromTime: controller.mondayFrom,
                toTime: controller.mondayTo,
              ),
              DayTimePickerWidget(
                dayName: 'Tuesday',
                isSelected: controller.isTuesdaySelected,
                fromTime: controller.tuesdayFrom,
                toTime: controller.tuesdayTo,
              ),
              DayTimePickerWidget(
                dayName: 'Wednesday',
                isSelected: controller.isWednesdaySelected,
                fromTime: controller.wednesdayFrom,
                toTime: controller.wednesdayTo,
              ),
              DayTimePickerWidget(
                dayName: 'Thursday',
                isSelected: controller.isThursdaySelected,
                fromTime: controller.thursdayFrom,
                toTime: controller.thursdayTo,
              ),
              DayTimePickerWidget(
                dayName: 'Friday',
                isSelected: controller.isFridaySelected,
                fromTime: controller.fridayFrom,
                toTime: controller.fridayTo,
              ),
              DayTimePickerWidget(
                dayName: 'Saturday',
                isSelected: controller.isSaturdaySelected,
                fromTime: controller.saturdayFrom,
                toTime: controller.saturdayTo,
              ),
              SizedBox(height: 40),
              Center(child: CommonButton(titleText: 'Next',onTap: (){
                Get.toNamed(AppRoutes.instance.addPhotoScreen,arguments: {
                  'fromBusinessHours': true
                });
              },))
            ],
          ),
        ),
      ),
    );
  }
}
