import 'dart:io';
import 'dart:math' as math;
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/gen/assets.gen.dart';
import 'package:hirconn_app/services/image_picker_service.dart';
import 'package:hirconn_app/widgets/dialogs/image_source_dialog.dart';

class ImageUploadWidget extends StatefulWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color iconCircleColor;
  final Color iconColor;
  final Color? addButtonColor;
  final String? initialImagePath;
  final Function(String imagePath)? onImageSelected;
  final int imageQuality;
  final bool showLoadingIndicator;
  final bool crop;

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
    this.crop = true,
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
      setState(() => _selectedImagePath = widget.initialImagePath);
    }
  }

  Future<void> _handleImageUpload() async {
    final source = await showImageSourceDialog();
    if (source == null) return;

    if (widget.showLoadingIndicator) {
      setState(() => _isLoading = true);
    }

    final File? imageFile = await _imagePickerService.pickImage(
      source: source,
      imageQuality: widget.imageQuality,
      crop: widget.crop,
    );

    if (widget.showLoadingIndicator) {
      setState(() => _isLoading = false);
    }

    if (imageFile != null) {
      setState(() => _selectedImagePath = imageFile.path);
      widget.onImageSelected?.call(imageFile.path);
    }
  }

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

            // ✅ Responsive sizes (and clamped so tiny cards still look good)
            final double addButtonSize =
            (iconCircleSize * 0.25).clamp(14.0, 40.0);
            final double addIconSize =
            (addButtonSize * 0.55).clamp(10.0, 18.0);

            // ✅ Responsive positioning (no fixed pixels)
            final double inset =
            (iconCircleSize * 0.04).clamp(1.0, 8.0); // bottom/right padding

            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                if (_selectedImagePath != null && !_isLoading)
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
                  Positioned(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
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

                        // ✅ Responsive bottom-right placement
                        Positioned(
                          bottom: inset,
                          right: inset,
                          child: Container(
                            width: addButtonSize,
                            height: addButtonSize,
                            decoration: BoxDecoration(
                              color: widget.addButtonColor ??
                                  AppColors.instance.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: math.min(8, addButtonSize * 0.35),
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
                    ),
                  ),

                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.addButtonColor ?? AppColors.instance.primary,
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
