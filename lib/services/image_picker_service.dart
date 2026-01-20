import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hirconn_app/utils/permission_helper.dart';
import 'package:hirconn_app/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:image_picker/image_picker.dart';

/// Professional image picker service that handles camera and gallery selection
/// with comprehensive permission handling
///
/// This is a singleton service that can be used throughout the app
class ImagePickerService {
  static final ImagePickerService _instance = ImagePickerService._internal();
  factory ImagePickerService() => _instance;
  ImagePickerService._internal();

  final ImagePicker _picker = ImagePicker();

  /// Pick an image from the camera
  ///
  /// Handles camera permission automatically
  /// Returns the selected image file or null if cancelled/failed
  Future<File?> pickFromCamera({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      // Request camera permission
      final hasPermission = await PermissionHelper.requestCameraPermission();

      if (!hasPermission) {
        AppSnackBar.error('Camera permission is required to take photos');
        return null;
      }

      // Pick image from camera
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      if (image == null) {
        return null;
      }

      return File(image.path);
    } catch (e) {
      debugPrint('ImagePickerService - Camera Error: $e');
      AppSnackBar.error('Failed to capture image. Please try again.');
      return null;
    }
  }

  /// Pick an image from the gallery
  ///
  /// Handles gallery/photos permission automatically
  /// Returns the selected image file or null if cancelled/failed
  Future<File?> pickFromGallery({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      // Request gallery permission
      final hasPermission = await PermissionHelper.requestGalleryPermission();

      if (!hasPermission) {
        AppSnackBar.error('Gallery permission is required to select photos');
        return null;
      }

      // Pick image from gallery
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      if (image == null) {
        return null;
      }

      return File(image.path);
    } catch (e) {
      debugPrint('ImagePickerService - Gallery Error: $e');
      AppSnackBar.error('Failed to select image. Please try again.');
      return null;
    }
  }

  /// Pick multiple images from the gallery
  ///
  /// Handles gallery/photos permission automatically
  /// Returns list of selected image files or empty list if cancelled/failed
  Future<List<File>> pickMultipleFromGallery({
    int limit = 10,
    int imageQuality = 85,
  }) async {
    try {
      // Request gallery permission
      final hasPermission = await PermissionHelper.requestGalleryPermission();

      if (!hasPermission) {
        AppSnackBar.error('Gallery permission is required to select photos');
        return [];
      }

      // Pick multiple images from gallery
      final List<XFile> images = await _picker.pickMultipleMedia(limit: limit);

      if (images.isEmpty) {
        return [];
      }

      return images.map((xfile) => File(xfile.path)).toList();
    } catch (e) {
      debugPrint('ImagePickerService - Multiple Gallery Error: $e');
      AppSnackBar.error('Failed to select images. Please try again.');
      return [];
    }
  }

  /// Pick an image from the specified source
  ///
  /// [source] - ImageSource.camera or ImageSource.gallery
  /// Returns the selected image file or null if cancelled/failed
  Future<File?> pickImage({
    required ImageSource source,
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
  }) async {
    if (source == ImageSource.camera) {
      return await pickFromCamera(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
    } else {
      return await pickFromGallery(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
    }
  }
}
