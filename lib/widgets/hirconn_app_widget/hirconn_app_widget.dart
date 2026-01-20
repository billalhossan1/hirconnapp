import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class HirconnSecondaryText extends StatelessWidget {
  final String text;
  const HirconnSecondaryText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      fontSize: 14,
      textColor: AppColors.instance.subTextColor,
    );
  }
}

class HirconnHeaderText extends StatelessWidget {
  final String title;
  const HirconnHeaderText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: title,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      textColor: AppColors.instance.primary,
    );
  }
}
