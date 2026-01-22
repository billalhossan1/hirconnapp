import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/services/storage_services/get_storage_services.dart';
import 'package:hirconn_app/utils/error_log.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {

  GetStorageServices storageServices = GetStorageServices.instance;

  late AnimationController lottieController;

  @override
  void onInit() {
    super.onInit();

    lottieController = AnimationController(vsync: this);

    _startFlow();
  }

  void _startFlow() {
    try {
      // 2 second পরে animation freeze
      Future.delayed(const Duration(seconds: 2), () {
        lottieController.stop(); // 🔥 freeze animation
      });

      // 2 second পরে navigate
      Future.delayed(const Duration(seconds: 2), () {
        // Get.offAllNamed(AppRoutes.instance.onBoardingScreen);

        Get.offAllNamed(AppRoutes.instance.businessBasicScreen);
        // Get.offAllNamed(AppRoutes.instance.personalPageDetailsScreen);
      });

    } catch (e) {
      errorLog("SplashScreenController", e);
      Get.offAllNamed(AppRoutes.instance.errorScreen);
    }
  }

  @override
  void onClose() {
    lottieController.dispose();
    super.onClose();
  }
}
