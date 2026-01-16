import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/services/storage_services/get_storage_services.dart';
import 'package:hirconn_app/utils/error_log.dart';

class SplashScreenController extends GetxController {
  ////////////  object
  GetStorageServices storageServices = GetStorageServices.instance;
  RxDouble animation = 0.0.obs;
  RxDouble animation2 = 0.0.obs;

  Future<void> onInitialDataLoadScreen() async {
    try {
      Future.delayed(Durations.medium1, () {
        animation.value = 1.0;
        animation2.value = 1.0;
      });

      // var value = storageServices.getOnboardScreen();
      Future.delayed(const Duration(seconds: 2), () {
        // if (value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAllNamed(AppRoutes.instance.onBoardingScreen);
        });
        // } else {
        //   Get.offAllNamed(AppRoutes.instance.wellCome);
        // }
      });

    } catch (e) {
      errorLog("onInitialDataLoadScreen", e);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(AppRoutes.instance.errorScreen);
      });
    }
  }

  @override
  void onInit() {
    onInitialDataLoadScreen();
    super.onInit();
  }
}
