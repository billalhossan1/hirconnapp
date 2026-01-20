import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/widgets/image_upload_widget/image_upload_widget.dart';
import 'package:hirconn_app/widgets/texts/app_text.dart';

/// Example screen demonstrating how to use the ImageUploadWidget
///
/// This is a reference implementation showing:
/// - Basic usage
/// - State management
/// - Multiple image uploads
/// - Custom styling
class ImageUploadExampleScreen extends StatefulWidget {
  const ImageUploadExampleScreen({super.key});

  @override
  State<ImageUploadExampleScreen> createState() =>
      _ImageUploadExampleScreenState();
}

class _ImageUploadExampleScreenState extends State<ImageUploadExampleScreen> {
  String? _profileImage;
  String? _coverImage;
  final List<String> _galleryImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          data: 'Image Upload Example',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        backgroundColor: AppColors.instance.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Profile Picture
            const AppText(
              data: 'Profile Picture',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 12),
            Center(
              child: ImageUploadWidget(
                width: 150,
                height: 150,
                initialImagePath: _profileImage,
                onImageSelected: (imagePath) {
                  setState(() {
                    _profileImage = imagePath;
                  });
                  debugPrint('Profile image selected: $imagePath');
                },
              ),
            ),
            if (_profileImage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: AppText(
                    data: 'Image selected!',
                    fontSize: 12,
                    color: AppColors.instance.success,
                  ),
                ),
              ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),

            // Example 2: Cover Image (Wide)
            const AppText(
              data: 'Cover Image',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 12),
            ImageUploadWidget(
              width: double.infinity,
              height: 200,
              backgroundColor: AppColors.instance.boxBg2,
              addButtonColor: AppColors.instance.primary,
              initialImagePath: _coverImage,
              onImageSelected: (imagePath) {
                setState(() {
                  _coverImage = imagePath;
                });
                debugPrint('Cover image selected: $imagePath');
              },
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),

            // Example 3: Custom Styled Upload
            const AppText(
              data: 'Custom Styled Upload',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ImageUploadWidget(
                    width: double.infinity,
                    height: 120,
                    backgroundColor: Colors.blue.shade50,
                    iconCircleColor: Colors.blue.shade100,
                    addButtonColor: Colors.blue,
                    imageQuality: 90,
                    onImageSelected: (imagePath) {
                      debugPrint('Custom image 1: $imagePath');
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ImageUploadWidget(
                    width: double.infinity,
                    height: 120,
                    backgroundColor: Colors.green.shade50,
                    iconCircleColor: Colors.green.shade100,
                    addButtonColor: Colors.green,
                    imageQuality: 90,
                    onImageSelected: (imagePath) {
                      debugPrint('Custom image 2: $imagePath');
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),

            // Example 4: Multiple Small Uploads (Grid)
            const AppText(
              data: 'Gallery Grid',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return ImageUploadWidget(
                  width: double.infinity,
                  height: double.infinity,
                  backgroundColor: AppColors.instance.boxBg,
                  initialImagePath: index < _galleryImages.length
                      ? _galleryImages[index]
                      : null,
                  onImageSelected: (imagePath) {
                    setState(() {
                      if (index < _galleryImages.length) {
                        _galleryImages[index] = imagePath;
                      } else {
                        _galleryImages.add(imagePath);
                      }
                    });
                    debugPrint('Gallery image $index: $imagePath');
                  },
                );
              },
            ),

            const SizedBox(height: 32),

            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.instance.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.instance.primary.withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.instance.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      AppText(
                        data: 'How to Use',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.instance.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppText(
                    data:
                        '1. Tap any widget to select an image\n'
                        '2. Choose Camera or Gallery from the dialog\n'
                        '3. Grant permissions if requested\n'
                        '4. Select or capture your image\n'
                        '5. The image will appear as a preview\n'
                        '6. Tap again to change the image',
                    fontSize: 13,
                    color: AppColors.instance.primaryTextColor,
                    maxLines: 10,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
