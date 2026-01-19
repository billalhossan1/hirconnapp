import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';

class CameraUploadCard extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconCircleColor;
  final Color iconColor;
  final double iconSize;
  final Color? addButtonColor;
  final VoidCallback? onTap;

  const CameraUploadCard({
    super.key,
    this.width = 150,
    this.height = 150,
    this.backgroundColor = const Color(0xFFF3EFFF),
    this.iconCircleColor = Colors.white,
    this.iconColor = Colors.black87,
    this.iconSize = 32,
    this.addButtonColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Card background
          Container(
            width: width.w,
            height: height.h,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // Circle with camera icon
          Container(
            width: width.w * 0.45,
            height: height.h * 0.45,
            decoration: BoxDecoration(
              color: iconCircleColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera_alt,
              color: iconColor,
              size: iconSize.h,
            ),
          ),
          // + Button
          Positioned(
            bottom: height.h * 0.15,
            right: width.w * 0.15,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: addButtonColor??AppColors.instance.primary,
                  shape: BoxShape.circle,
                ),
                child:  Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
