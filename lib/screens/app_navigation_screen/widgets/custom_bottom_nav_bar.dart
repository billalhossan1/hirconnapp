import 'package:core_kit/utils/core_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirconn_app/gen/assets.gen.dart';

import '../../../app_all_enum/app_login_status.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> userIcons = [
      Assets.svg.p1,
      Assets.svg.p2,
      Assets.svg.p3,
      Assets.svg.p4,
      Assets.svg.p5,
      Assets.svg.p6,

    ];    final List<String> businessIcons = [
      Assets.svg.b1,
      Assets.svg.b2,
      Assets.svg.b3,
      Assets.svg.b4,
      Assets.svg.b5,

    ];

    return Container(
      height: 70 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(selectedAppUserType == AppUserType.user?userIcons.length:businessIcons.length, (index) {
          final isSelected = currentIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Indicator Bar
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 4,
                    width: isSelected ? 40 : 0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A1B9A), // Purple indicator
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Icon
                  SvgPicture.asset(
                    selectedAppUserType == AppUserType.user? userIcons[index]:businessIcons[index],
                    width: 72.w,
                    height: 72.w,
                    // If the icon is not colorful enough, we might need to handle colors
                    // But the design shows colorful icons, so we assume SVGs are colorful
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
