import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CommonCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<dynamic> onChanged;
  final String text;
  const CommonCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.text,
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
            width: 18,
            height: 18,
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              side: const BorderSide(color: Color(0xFFBDBDBD), width: 1),
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
            fontSize: 15,
            fontWeight: FontWeight.w400,
            textColor: AppColors.instance.primary,
          ),
        ),
      ],
    );
  }
}
