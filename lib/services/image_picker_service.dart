import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/utils/permission_helper.dart';
import 'package:hirconn_app/widgets/app_snack_bar/app_snack_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

/// Professional image picker service that handles camera and gallery selection
/// with comprehensive permission handling and image cropping
///
/// This is a singleton service that can be used throughout the app
class ImagePickerService {
  static final ImagePickerService _instance = ImagePickerService._internal();
  factory ImagePickerService() => _instance;
  ImagePickerService._internal();

  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();

  /// Pick an image from the camera
  ///
  /// Handles camera permission automatically
  /// [crop] - Whether to show the crop UI after picking
  /// Returns the selected image file or null if cancelled/failed
  Future<File?> pickFromCamera({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
    bool crop = true,
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

      File imageFile = File(image.path);

      // Crop image if requested
      if (crop) {
        final croppedFile = await cropImage(imageFile.path);
        if (croppedFile != null) {
          imageFile = File(croppedFile.path);
        } else {
          return null; // User cancelled cropping
        }
      }

      return imageFile;
    } catch (e) {
      debugPrint('ImagePickerService - Camera Error: $e');
      AppSnackBar.error('Failed to capture image. Please try again.');
      return null;
    }
  }

  /// Pick an image from the gallery
  ///
  /// Handles gallery/photos permission automatically
  /// [crop] - Whether to show the crop UI after picking
  /// Returns the selected image file or null if cancelled/failed
  Future<File?> pickFromGallery({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
    bool crop = true,
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

      File imageFile = File(image.path);

      // Crop image if requested
      if (crop) {
        final croppedFile = await cropImage(imageFile.path);
        if (croppedFile != null) {
          imageFile = File(croppedFile.path);
        } else {
          return null; // User cancelled cropping
        }
      }

      return imageFile;
    } catch (e) {
      debugPrint('ImagePickerService - Gallery Error: $e');
      AppSnackBar.error('Failed to select image. Please try again.');
      return null;
    }
  }

  /// Crop an image at the given path
  /// Returns CroppedFile or null if cancelled
  Future<CroppedFile?> cropImage(String sourcePath) async {
    try {
      return await _cropper.cropImage(
        sourcePath: sourcePath,
        compressQuality: 90,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: AppColors.instance.primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            statusBarColor:
                Colors.black, // Dark status bar prevents toolbar overlap issues
            activeControlsWidgetColor: AppColors.instance.primary,
            backgroundColor: Colors.white,
            hideBottomControls: false,
            showCropGrid: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: false,
            resetButtonHidden: false,
            rotateButtonsHidden: false,
            rotateClockwiseButtonHidden: false,
            hidesNavigationBar:
                false, // Required for iOS Notch / Safe Area support
            doneButtonTitle: 'Done',
            cancelButtonTitle: 'Cancel',
            showCancelConfirmationDialog: true,
          ),
        ],
      );
    } catch (e) {
      debugPrint('ImagePickerService - Crop Error: $e');
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
  /// [crop] - Whether to show the crop UI after picking
  /// Returns the selected image file or null if cancelled/failed
  Future<File?> pickImage({
    required ImageSource source,
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
    bool crop = true,
  }) async {
    if (source == ImageSource.camera) {
      return await pickFromCamera(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        crop: crop,
      );
    } else {
      return await pickFromGallery(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        crop: crop,
      );
    }
  }
}
