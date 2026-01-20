import 'dart:io';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/gen/assets.gen.dart';
import 'package:hirconn_app/services/image_picker_service.dart';
import 'package:hirconn_app/widgets/dialogs/image_source_dialog.dart';

/// Professional image upload widget with camera/gallery selection and preview
///
/// Features:
/// - Shows camera icon by default (no image)
/// - Displays image preview when selected
/// - Opens dialog to choose camera or gallery
/// - Handles all permissions automatically
/// - Fully customizable design
/// - Reusable across the entire app
///
/// Usage:
/// ```dart
/// ImageUploadWidget(
///   onImageSelected: (imagePath) {
///     print('Selected image: $imagePath');
///   },
/// )
/// ```
class ImageUploadWidget extends StatefulWidget {
  /// Width of the widget
  final double width;

  /// Height of the widget
  final double height;

  /// Background color of the card
  final Color backgroundColor;

  /// Color of the icon circle
  final Color iconCircleColor;

  /// Color of the camera icon
  final Color iconColor;

  /// Color of the add/edit button
  final Color? addButtonColor;

  /// Initial image path (optional) - can be local file path or network URL
  final String? initialImagePath;

  /// Callback when image is selected - returns the local file path
  final Function(String imagePath)? onImageSelected;

  /// Image quality (0-100) - default 85
  final int imageQuality;

  /// Show loading indicator while picking image
  final bool showLoadingIndicator;

  const ImageUploadWidget({
    super.key,
    this.width = 150,
    this.height = 150,
    this.backgroundColor = const Color(0xFFF3EFFF),
    this.iconCircleColor = Colors.white,
    this.iconColor = Colors.black87,
    this.addButtonColor,
    this.initialImagePath,
    this.onImageSelected,
    this.imageQuality = 85,
    this.showLoadingIndicator = true,
  });

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  String? _selectedImagePath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedImagePath = widget.initialImagePath;
  }

  @override
  void didUpdateWidget(ImageUploadWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialImagePath != oldWidget.initialImagePath) {
      setState(() {
        _selectedImagePath = widget.initialImagePath;
      });
    }
  }

  /// Handle image upload - show dialog and pick image
  Future<void> _handleImageUpload() async {
    // Show image source dialog
    final source = await showImageSourceDialog();

    if (source == null) {
      return; // User cancelled
    }

    // Show loading indicator
    if (widget.showLoadingIndicator) {
      setState(() {
        _isLoading = true;
      });
    }

    // Pick image from selected source
    final File? imageFile = await _imagePickerService.pickImage(
      source: source,
      imageQuality: widget.imageQuality,
    );

    // Hide loading indicator
    if (widget.showLoadingIndicator) {
      setState(() {
        _isLoading = false;
      });
    }

    // Update UI and notify parent
    if (imageFile != null) {
      setState(() {
        _selectedImagePath = imageFile.path;
      });

      // Notify parent widget
      widget.onImageSelected?.call(imageFile.path);
    }
  }

  /// Check if the image path is a network URL
  bool _isNetworkImage(String? path) {
    if (path == null) return false;
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading ? null : _handleImageUpload,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
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
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                // Image preview or camera icon
                if (_selectedImagePath != null && !_isLoading)
                  // Show image preview
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: _isNetworkImage(_selectedImagePath)
                        ? CommonImage(
                            src: _selectedImagePath!,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                          )
                        : Image.file(
                            File(_selectedImagePath!),
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            fit: BoxFit.cover,
                          ),
                  )
                else if (!_isLoading)
                  // Show camera icon (default state)
                  Positioned(
                    child: Container(
                      width: iconCircleSize,
                      height: iconCircleSize,
                      decoration: BoxDecoration(
                        color: widget.iconCircleColor,
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
                  ),

                // Loading indicator
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.addButtonColor ?? AppColors.instance.primary,
                      ),
                    ),
                  ),

                // Add/Edit button (bottom-right)
                if (!_isLoading)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      width: addButtonSize,
                      height: addButtonSize,
                      decoration: BoxDecoration(
                        color:
                            widget.addButtonColor ?? AppColors.instance.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        _selectedImagePath != null ? Icons.edit : Icons.add,
                        color: Colors.white,
                        size: addIconSize,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Legacy widget name for backward compatibility
/// Use [ImageUploadWidget] instead
@Deprecated('Use ImageUploadWidget instead')
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
    return ImageUploadWidget(
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      iconCircleColor: iconCircleColor,
      iconColor: iconColor,
      addButtonColor: addButtonColor,
      onImageSelected: (_) => onTap?.call(),
    );
  }
}
