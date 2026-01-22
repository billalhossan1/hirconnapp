import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class HirconnSecondaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const   HirconnSecondaryText({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      textAlign: .start,
      isDescription: true,
      text: text,
      fontSize:fontSize?? 14,
      textColor: AppColors.instance.subTextColor,
    );
  }
}

class HirconnHeaderText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  const HirconnHeaderText({super.key, required this.title, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      textAlign: .start,
      isDescription: true,
      text: title,
      fontSize: fontSize??20,
      fontWeight: fontWeight??FontWeight.bold,
      textColor: AppColors.instance.primary,
    );
  }
}
