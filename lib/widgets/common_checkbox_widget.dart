import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CommonCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<dynamic> onChanged;
  final Color? textColor;
  final String text;
  final double? size;
  final double? textSize;
  final Color? checkBorderColor;
  const CommonCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.text, this.textColor, this.checkBorderColor, this.size, this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ compact + top aligned checkbox (matches screenshot)
        Padding(
          padding: const EdgeInsets.only(top: 2), // aligns checkbox with text
          child: SizedBox(
            width: size??18.w,
            height: size??18.h,
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,

              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              side:  BorderSide(color: checkBorderColor??Color(0xFFBDBDBD), width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        8.width,
        Expanded(
          child: CommonText(
            textAlign: .start,
            isDescription: true,
            text: text,
            fontSize: textSize??15,
            fontWeight: FontWeight.w400,
            textColor: textColor??AppColors.instance.primary,
          ),
        ),
      ],
    );
  }
}
