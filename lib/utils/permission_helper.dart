import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/widgets/texts/app_text.dart';
import 'package:permission_handler/permission_handler.dart';

/// A comprehensive permission helper utility that handles all permission-related operations
/// This is a reusable utility that can be used for any permission type across the app
class PermissionHelper {
  /// Request a specific permission with custom dialog messages
  ///
  /// [permission] - The permission to request
  /// [title] - Dialog title
  /// [message] - Dialog message explaining why permission is needed
  /// [settingsMessage] - Message shown when permission is permanently denied
  ///
  /// Returns true if permission is granted, false otherwise
  static Future<bool> requestPermission({
    required Permission permission,
    required String title,
    required String message,
    String? settingsMessage,
  }) async {
    try {
      final status = await permission.status;

      // Permission already granted
      if (status.isGranted || status.isLimited) {
        return true;
      }

      // Permission denied - show explanation dialog first
      if (status.isDenied) {
        final shouldRequest = await _showPermissionDialog(
          title: title,
          message: message,
          confirmText: 'Allow Access',
          cancelText: 'Cancel',
        );

        if (!shouldRequest) {
          return false;
        }

        final result = await permission.request();
        return result.isGranted || result.isLimited;
      }

      // Permission permanently denied - need to open settings
      if (status.isPermanentlyDenied) {
        final shouldOpenSettings = await _showPermissionDialog(
          title: title,
          message: settingsMessage ?? message,
          confirmText: 'Open Settings',
          cancelText: 'Cancel',
        );

        if (shouldOpenSettings) {
          await openAppSettings();
          // Check permission status after returning from settings
          final newStatus = await permission.status;
          return newStatus.isGranted || newStatus.isLimited;
        }
        return false;
      }

      return false;
    } catch (e) {
      debugPrint('PermissionHelper Error: $e');
      return false;
    }
  }

  /// Request camera permission with platform-specific handling
  static Future<bool> requestCameraPermission() async {
    return await requestPermission(
      permission: Permission.camera,
      title: 'Camera Access Required',
      message: '''We need access to your camera to take photos.

This allows you to capture images directly from your device's camera for profile pictures, posts, or other content.

Your privacy is important - photos are only taken when you choose to use the camera.''',
      settingsMessage: '''Camera access is currently disabled.

To enable camera access:
1. Tap "Open Settings" below
2. Find and enable Camera permission
3. Return to the app

This permission is required to take photos.''',
    );
  }

  /// Request gallery/photos permission with platform-specific handling
  static Future<bool> requestGalleryPermission() async {
    if (Platform.isIOS) {
      return await requestPermission(
        permission: Permission.photos,
        title: 'Photos Access Required',
        message: '''We need access to your photo library to select images.

This allows you to choose photos from your device for profile pictures, posts, or other content.

Your data is never shared and stays on your device unless you choose to upload it.''',
        settingsMessage: '''Photos access is currently disabled.

To enable photos access:
1. Tap "Open Settings" below
2. Find and enable Photos permission
3. Return to the app

This permission is required to select photos from your library.''',
      );
    } else {
      // Android 13+ uses different permissions
      if (Platform.isAndroid) {
        // Try photos permission first (Android 13+)
        final photosGranted = await requestPermission(
          permission: Permission.photos,
          title: 'Photos Access Required',
          message: '''We need access to your photos to select images.

This allows you to choose photos from your device for profile pictures, posts, or other content.

Your data is never shared and stays on your device unless you choose to upload it.''',
          settingsMessage: '''Photos access is currently disabled.

To enable photos access:
1. Tap "Open Settings" below
2. Find and enable Photos/Media permission
3. Return to the app

This permission is required to select photos.''',
        );

        if (photosGranted) return true;

        // Fallback to storage permission for older Android versions
        return await requestPermission(
          permission: Permission.storage,
          title: 'Storage Access Required',
          message: '''We need access to your device storage to select images.

This allows you to choose photos from your device for profile pictures, posts, or other content.

Your data is never shared and stays on your device unless you choose to upload it.''',
          settingsMessage: '''Storage access is currently disabled.

To enable storage access:
1. Tap "Open Settings" below
2. Find and enable Storage permission
3. Return to the app

This permission is required to select photos.''',
        );
      }
      return false;
    }
  }

  /// Show a permission dialog with custom message
  static Future<bool> _showPermissionDialog({
    required String title,
    required String message,
    required String confirmText,
    required String cancelText,
  }) async {
    bool userConfirmed = false;

    await Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              AppText(
                data: title,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Message
              AppText(
                data: message,
                fontSize: 14,
                textAlign: TextAlign.center,
                maxLines: 20,
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  // Cancel button
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        userConfirmed = false;
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: AppText(
                        data: cancelText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Confirm button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        userConfirmed = true;
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: AppText(
                        data: confirmText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.instance.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    return userConfirmed;
  }
}
