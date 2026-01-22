import 'package:core_kit/core_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/constant/app_constant.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/widgets/custom_alert_dialog/custom_alert_dialog.dart';

class PersonalPageDetailsController extends GetxController {
  RxInt age = 0.obs;

  void calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int calculatedAge = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      calculatedAge--;
    }
    age.value = calculatedAge;
  }

  RxString selectedState = ''.obs;
  RxString selectedCountry = ''.obs;

  void setSelectedState(String state) {
    selectedState.value = state;
  }

  void setSelectedCountry(String country) {
    selectedCountry.value = country;
  }

  /// Safely extract the gender/title from the dropdown value.
  ///
  /// The dropdown in the UI provides a widget (e.g. a custom `DropDownItemWidget`) or
  /// a plain string. This method returns the underlying title string when possible.
  String getGenderFromWidget(dynamic value) {
    if (value == null) return '';
    // If the dropdown returns a plain String, return it directly.
    if (value is String) return value;

    // Many custom dropdown items carry a `title` field. Use `dynamic` access to
    // avoid a hard compile-time dependency on the widget class here.
    try {
      final dynamic maybeTitle = (value as dynamic).title;
      if (maybeTitle is String) return maybeTitle;
    } catch (_) {
      // ignore and fall through to other attempts
    }

    // If the widget contains a Text child with the title, try toString fallback.
    try {
      final text = value.toString();
      // Some widgets include the title in toString; try a quick extract.
      // This is a best-effort fallback and may return the full toString if nothing else.
      return text;
    } catch (_) {
      return '';
    }
  }

  void onTapNext() {
    ShowCustomDialog.showOneButtonDialog(
      primaryButtonText: 'Got it',
      onPrimaryPressed: (){
        Get.back();
        Get.toNamed(AppRoutes.instance.addPhotoScreen);
      },
      context: Get.context!,
      isLogoVisible: true,
      content: Column(
        children: [
        RichText(text: TextSpan(
          children: [
          TextSpan(
            text: 'Hirconn',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.instance.primary,
          fontFamily: AppConstant.instance.font
            )
          ),
            TextSpan(
                text: ' is currently available only to users who are ',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.instance.subTextColor,
                  height: 1.5,
                  fontFamily: AppConstant.instance.font
                )
            ),
            TextSpan(
                text: '18 years or older.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.instance.subTextColor,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  fontFamily: AppConstant.instance.font
                )
            ),
          ]
        )),
          10.height,
          CommonText(
            text: "Based on the information you entered, you're not eligible to create an account right now.",
            fontSize: 14,
            textAlign: TextAlign.center,
            textColor: AppColors.instance.subTextColor,
            isDescription: true,
          ),


        ],
      ),
    );
  }
}
