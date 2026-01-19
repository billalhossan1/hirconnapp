import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/gen/assets.gen.dart';

class CameraUploadCard extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconCircleColor;
  final Color iconColor;
  final Color? addButtonColor;
  final VoidCallback? onTap;

  const CameraUploadCard({
    super.key,
    this.width = 150,
    this.height = 150,
    this.backgroundColor = const Color(0xFFF3EFFF),
    this.iconCircleColor = Colors.white,
    this.iconColor = Colors.black87,
    this.addButtonColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double iconCircleSize = constraints.maxHeight * 0.4;
          final double iconSize = iconCircleSize * 0.5;
          final double addButtonSize = iconCircleSize * 0.3;
          final double addIconSize = addButtonSize * 0.6;

          return Stack(
            alignment: Alignment.center,
            children: [
              // Card background
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              // Center camera icon with + button overlaid
              Positioned(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: iconCircleSize,
                      height: iconCircleSize,
                      decoration: BoxDecoration(
                        color: iconCircleColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: CommonImage(
                          src: Assets.svg.camera,
                          height: iconSize,
                          width: iconSize,
                        ),
                      ),
                    ),

                    // + button attached to bottom-right of icon circle
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: addButtonSize,
                          height: addButtonSize,
                          decoration: BoxDecoration(
                            color: addButtonColor??AppColors.instance.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: addIconSize,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
