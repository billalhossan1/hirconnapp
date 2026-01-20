import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/gen/assets.gen.dart';
import 'package:hirconn_app/routes/app_routes.dart';

class ProfileSuccessScreen extends StatelessWidget {
  const ProfileSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // ✅ center horizontally
            children: [
              CommonImage(src: Assets.svg.congrats),
              20.height,
              CommonText(
                text: '[ Gbenga ], your profile is live!',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                textColor: AppColors.instance.primary,
                textAlign: TextAlign.center,
              ),
              10.height,
              CommonText(text: 'Start connecting, sharing updates, and finding professionals to hire',
                fontSize: 14,
                isDescription: true,
                textAlign: TextAlign.center,
                textColor: AppColors.instance.subTextColor,
              ),

              // RichText(
              //   textAlign: TextAlign.center,
              //   text: TextSpan(
              //     style: TextStyle(
              //       fontSize: 14,
              //       color: AppColors.instance.subTextColor,
              //       height: 1.3,
              //     ),
              //     children: const [
              //       TextSpan(text: 'Your application has been shared with '),
              //       TextSpan(
              //         text: 'Gbenga',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: Colors.black,
              //         ),
              //       ),
              //       TextSpan(text: '. They may reach out if there’s a fit'),
              //     ],
              //   ),
              // ),
              20.height,
              CommonButton(titleText: 'View Profile',onTap: (){
                Get.offAllNamed(AppRoutes.instance.appNavigationScreen);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
