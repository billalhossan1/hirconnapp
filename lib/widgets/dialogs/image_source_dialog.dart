import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/widgets/texts/app_text.dart';
import 'package:image_picker/image_picker.dart';

/// Beautiful dialog to select image source (Camera or Gallery)
///
/// Returns the selected ImageSource or null if cancelled
///
/// Usage:
/// ```dart
/// final source = await showImageSourceDialog();
/// if (source != null) {
///   // Use the selected source
/// }
/// ```
Future<ImageSource?> showImageSourceDialog() async {
  return await Get.dialog<ImageSource>(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const ImageSourceDialogContent(),
    ),
    barrierDismissible: true,
  );
}

/// Content widget for the image source selection dialog
class ImageSourceDialogContent extends StatelessWidget {
  const ImageSourceDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          AppText(
            data: 'Choose Image Source',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            color: AppColors.instance.primaryTextColor,
          ),
          const SizedBox(height: 8),

          // Subtitle
          AppText(
            data: 'Select where you want to pick the image from',
            fontSize: 14,
            textAlign: TextAlign.center,
            color: AppColors.instance.subTextColor,
          ),
          const SizedBox(height: 24),

          // Camera Option
          _ImageSourceOption(
            icon: Icons.camera_alt_rounded,
            title: 'Camera',
            subtitle: 'Take a new photo',
            onTap: () {
              Get.back(result: ImageSource.camera);
            },
          ),
          const SizedBox(height: 12),

          // Gallery Option
          _ImageSourceOption(
            icon: Icons.photo_library_rounded,
            title: 'Gallery',
            subtitle: 'Choose from your photos',
            onTap: () {
              Get.back(result: ImageSource.gallery);
            },
          ),
          const SizedBox(height: 20),

          // Cancel Button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: AppText(
                data: 'Cancel',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.instance.subTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual option widget for image source selection
class _ImageSourceOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ImageSourceOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.instance.boxBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.instance.border.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.instance.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.instance.primary, size: 28),
              ),
              const SizedBox(width: 16),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      data: title,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.instance.primaryTextColor,
                    ),
                    const SizedBox(height: 2),
                    AppText(
                      data: subtitle,
                      fontSize: 13,
                      color: AppColors.instance.subTextColor,
                    ),
                  ],
                ),
              ),

              // Arrow
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.instance.subTextColor,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
