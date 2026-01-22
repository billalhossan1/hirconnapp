import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/screens/verification_successfull_screen/verification_success_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:hirconn_app/screens/splash_screen/controller/splash_screen_controller.dart';
import 'package:hirconn_app/utils/app_size.dart';

class VerificationSuccessfullScreen extends StatelessWidget {
  const VerificationSuccessfullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppSize.size = size;

    return GetBuilder<VerificationSuccessController>(
      init: VerificationSuccessController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Lottie.asset(
                'assets/lottie/verfication.json',
                controller: controller.lottieController,
                width: size.width,
                height: size.height,
                fit: BoxFit.contain,
                onLoaded: (composition) {
                  controller.lottieController
                    ..duration = composition.duration
                    ..forward(); // ▶ start animation
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
