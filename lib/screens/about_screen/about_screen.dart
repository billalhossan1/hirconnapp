import 'package:core_kit/app_bar/common_app_bar.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          CommonText(text: 'About', fontSize: 20, fontWeight: FontWeight.bold),
          6.height,
          CommonText(text: 'This helps others understand who you are',fontSize: 14,textColor: AppColors.instance.subTextColor,),
          10.height,

        ],
      ),
    );
  }
}
