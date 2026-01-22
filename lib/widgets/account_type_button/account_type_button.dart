import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';

import '../../gen/assets.gen.dart';

/// Reusable account type button used in login/sign-up screens.
///
/// Inputs:
/// - selected: whether this option is selected
/// - onTap: tap callback
/// - icon: IconData to show
/// - label: text label
class AccountTypeButton extends StatelessWidget {
  final bool selected;
  final VoidCallback? onTap;
  final String iconSvg;
  final String label;

  const AccountTypeButton({
    super.key,
    required this.selected,
    this.onTap,
    required this.iconSvg,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = selected ? AppColors.instance.primary : const Color(0xffF5F5F5);
    final textColor = selected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min, // 🔥 important
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: CommonImage(src: iconSvg, height: 24, width: 24),
              ),
              CommonText(
                text: label,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: textColor,
              ),
              const SizedBox(width: 8), // Spacer বাদ দিতে হবে ❌
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                height: 24.sp,
                width: 24.sp,
                child: selected
                    ? CommonImage(
                  src: Assets.svg.done,
                  height: 20.sp,
                  width: 20.sp,
                )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

