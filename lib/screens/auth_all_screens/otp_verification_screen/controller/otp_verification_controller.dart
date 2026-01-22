import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/utils/app_log.dart';
import 'package:hirconn_app/utils/error_log.dart';
import 'package:hirconn_app/widgets/app_snack_bar/app_snack_bar.dart';

class OtpVerificationController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString email = "".obs;
  RxBool fromBusiness = false.obs;

  void checkOtpFunction() {
    try {
      if (formKey.currentState!.validate()) {
        appLog("frombusiness====================${fromBusiness.value}");
        if(fromBusiness.value){
          Get.toNamed(AppRoutes.instance.businessBasicScreen);
        } else {
          Get.offAllNamed(AppRoutes.instance.loginScreen);
        }
      }
    } catch (e) {
      errorLog("checkOtpFunction", e);
    }
  }

  Future<void> onAppInitialDataLoadFunction()async {
    try {
      // final argData = Get.arguments;
      // if (argData is String) {
      //   email.value = argData;
      //   startTimer();
      // } else {
      //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //     Get.offAllNamed(AppRoutes.instance.errorScreen);
      //   });
      // }
      fromBusiness.value = Get.arguments['fromBusiness'] ?? false;
      email.value = Get.arguments['email'] ?? "";
      startTimer();
    } catch (e) {
      errorLog("message", e);
    }
  }

  //////////////////////// Otp timer //////////////////////////
  RxInt secondsRemaining = 60.obs;
  Timer? _timer;

  void reSendOtp() {
    try {
      secondsRemaining.value = 60;
      startTimer();
    } catch (e) {
      errorLog("reSendOtp", e);
    }
  }

  void startTimer() {
    try {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (secondsRemaining.value > 0) {
          secondsRemaining.value = secondsRemaining.value - 1;
        } else {
          _timer?.cancel();
        }
      });
    } catch (e) {
      errorLog("startTimer", e);
    }
  }

  void onAppClose() {
    try {
      _timer?.cancel();
    } catch (e) {
      errorLog("onAppClose", e);
    }
  }

  @override
  Future<void> onInit() async {
    onAppInitialDataLoadFunction();
    super.onInit();
  }

  @override
  void onClose() {
    onAppClose();
    super.onClose();
  }
}
