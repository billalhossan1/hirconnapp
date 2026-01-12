import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/utils/error_log.dart';

class LoginScreenController extends GetxController {
  ////////// object
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void checkValidation() {
    try {
      if (formKey.currentState!.validate()) {
        Get.offAndToNamed(AppRoutes.instance.appNavigationScreen);
      }
    } catch (e) {
      errorLog("checkValidation", e);
    }
  }

  ///////////. app. close
  void appOnClose() {
    try {
      emailTextEditingController.dispose();
      passwordTextEditingController.dispose();
    } catch (e) {
      errorLog("appOnClose", e);
    }
  }

  @override
  void onClose() {
    appOnClose();
    super.onClose();
  }
}
