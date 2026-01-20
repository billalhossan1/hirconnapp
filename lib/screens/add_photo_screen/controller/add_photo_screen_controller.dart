import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';

/// Controller for Add Photo Screen
/// Manages profile photo and gallery photos (up to 6 additional photos)
class AddPhotoScreenController extends GetxController {
  // Main profile photo
  final Rx<String?> profilePhoto = Rx<String?>(null);

  // Additional gallery photos (max 6)
  final RxList<String?> galleryPhotos = RxList<String?>.filled(6, null);

  /// Update profile photo
  void updateProfilePhoto(String imagePath) {
    profilePhoto.value = imagePath;
    debugPrint('Profile photo updated: $imagePath');
  }

  /// Update gallery photo at specific index
  void updateGalleryPhoto(int index, String imagePath) {
    if (index >= 0 && index < galleryPhotos.length) {
      galleryPhotos[index] = imagePath;
      debugPrint('Gallery photo $index updated: $imagePath');
    }
  }

  /// Remove profile photo
  void removeProfilePhoto() {
    profilePhoto.value = null;
  }

  /// Remove gallery photo at specific index
  void removeGalleryPhoto(int index) {
    if (index >= 0 && index < galleryPhotos.length) {
      galleryPhotos[index] = null;
    }
  }

  /// Get all selected photos (profile + gallery)
  List<String> getAllPhotos() {
    final List<String> allPhotos = [];

    // Add profile photo if exists
    if (profilePhoto.value != null) {
      allPhotos.add(profilePhoto.value!);
    }

    // Add gallery photos if exist
    for (var photo in galleryPhotos) {
      if (photo != null) {
        allPhotos.add(photo);
      }
    }

    return allPhotos;
  }

  /// Check if profile photo is selected
  bool get hasProfilePhoto => profilePhoto.value != null;

  /// Get count of selected gallery photos
  int get selectedGalleryCount {
    return galleryPhotos.where((photo) => photo != null).length;
  }

  /// Check if all photos are selected (1 profile + 6 gallery)
  bool get allPhotosSelected {
    return hasProfilePhoto && selectedGalleryCount == 6;
  }

  /// Validate - at least profile photo should be selected
  bool validate() {
    if (!hasProfilePhoto) {
      Get.snackbar(
        'Profile Photo Required',
        'Please upload at least one profile photo',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  /// Submit photos (implement your upload logic here)
  Future<void> submitPhotos() async {
    // if (!validate()) return;

    // final photos = getAllPhotos();
    // debugPrint('Submitting ${photos.length} photos');

    // TODO: Implement your photo upload logic here
    // Example:
    // await uploadPhotosToServer(photos);

    // For now, just show success message
    Get.toNamed(AppRoutes.instance.aboutScreen);
  }
}
