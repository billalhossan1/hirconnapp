import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_constant.dart';
import '../../../widgets/custom_alert_dialog/custom_alert_dialog.dart';

class ContactSupportController extends GetxController{
  void onTapNext() {
    ShowCustomDialog.showOneButtonDialog(

      primaryButtonText: 'Got it',
      onPrimaryPressed: () {
        Get.back();
        // Get.toNamed(
        //   AppRoutes.instance.addPhotoScreen,
        //   arguments: {'fromBusinessHours': false},
        // );
      },
      context: Get.context!,
      isLogoVisible: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(text: 'Message Send',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            textColor: AppColors.instance.primary,
          ),
          20.height,
          CommonText(
            isDescription: true,
            textAlign: TextAlign.center,
            text: 'We’ve received your request. Our support team will reply to your email as soon as possible.',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            textColor: AppColors.instance.subTextColor,
          ),
          10.height,

        ],
      ),
    );
  }

}