# Image Upload Widget - Usage Guide

## Overview
The `ImageUploadWidget` is a professional, reusable component for image selection with camera/gallery options and comprehensive permission handling.

## Features
✅ Camera and gallery selection via dialog  
✅ Automatic permission handling (iOS & Android)  
✅ Image preview with edit functionality  
✅ Loading states  
✅ Network and local image support  
✅ Fully customizable design  
✅ Reusable across entire project  

## Basic Usage

### Simple Example
```dart
import 'package:hirconn_app/widgets/image_upload_widget/image_upload_widget.dart';

ImageUploadWidget(
  onImageSelected: (imagePath) {
    print('Selected image: $imagePath');
    // Use the image path to upload to server, save locally, etc.
  },
)
```

### With Initial Image
```dart
ImageUploadWidget(
  initialImagePath: 'https://example.com/profile.jpg', // Network URL
  onImageSelected: (imagePath) {
    // Handle new image selection
    uploadToServer(imagePath);
  },
)
```

### Custom Styling
```dart
ImageUploadWidget(
  width: 200,
  height: 200,
  backgroundColor: Colors.blue.shade50,
  iconCircleColor: Colors.white,
  addButtonColor: Colors.blue,
  imageQuality: 90, // Higher quality
  onImageSelected: (imagePath) {
    setState(() {
      _profileImage = imagePath;
    });
  },
)
```

### In a Form (Profile Screen Example)
```dart
class ProfileEditScreen extends StatefulWidget {
  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String? _selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Image Upload
            Center(
              child: ImageUploadWidget(
                width: 150,
                height: 150,
                initialImagePath: _selectedImagePath,
                onImageSelected: (imagePath) {
                  setState(() {
                    _selectedImagePath = imagePath;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            
            // Other form fields
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            
            SizedBox(height: 20),
            
            // Save Button
            ElevatedButton(
              onPressed: () {
                if (_selectedImagePath != null) {
                  // Upload image and save profile
                  uploadProfileImage(_selectedImagePath!);
                }
              },
              child: Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Multiple Images (Using the Service Directly)
```dart
import 'package:hirconn_app/services/image_picker_service.dart';

// For selecting multiple images
final imagePickerService = ImagePickerService();
final images = await imagePickerService.pickMultipleFromGallery(limit: 5);

for (var image in images) {
  print('Selected: ${image.path}');
}
```

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | `double` | `150` | Width of the widget |
| `height` | `double` | `150` | Height of the widget |
| `backgroundColor` | `Color` | `Color(0xFFF3EFFF)` | Background color of the card |
| `iconCircleColor` | `Color` | `Colors.white` | Color of the icon circle |
| `iconColor` | `Color` | `Colors.black87` | Color of the camera icon |
| `addButtonColor` | `Color?` | `AppColors.primary` | Color of the add/edit button |
| `initialImagePath` | `String?` | `null` | Initial image (local path or URL) |
| `onImageSelected` | `Function(String)?` | `null` | Callback with selected image path |
| `imageQuality` | `int` | `85` | Image quality (0-100) |
| `showLoadingIndicator` | `bool` | `true` | Show loading during selection |

## Using the Services Independently

### Permission Helper
```dart
import 'package:hirconn_app/utils/permission_helper.dart';
import 'package:permission_handler/permission_handler.dart';

// Request camera permission
final hasCamera = await PermissionHelper.requestCameraPermission();

// Request gallery permission
final hasGallery = await PermissionHelper.requestGalleryPermission();

// Request any permission with custom messages
final hasLocation = await PermissionHelper.requestPermission(
  permission: Permission.location,
  title: 'Location Access',
  message: 'We need your location to show nearby events',
);
```

### Image Picker Service
```dart
import 'package:hirconn_app/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';

final service = ImagePickerService();

// Pick from camera
final cameraImage = await service.pickFromCamera(imageQuality: 90);

// Pick from gallery
final galleryImage = await service.pickFromGallery();

// Pick from specific source
final image = await service.pickImage(
  source: ImageSource.camera,
  imageQuality: 85,
  maxWidth: 1920,
  maxHeight: 1080,
);

// Pick multiple images
final images = await service.pickMultipleFromGallery(limit: 10);
```

### Image Source Dialog
```dart
import 'package:hirconn_app/widgets/dialogs/image_source_dialog.dart';

// Show dialog and get user selection
final source = await showImageSourceDialog();

if (source != null) {
  // User selected camera or gallery
  print('Selected: $source');
}
```

## Platform Configuration

### iOS (Info.plist)
Add these keys to `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to take photos for your profile and posts</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select images for your profile and posts</string>
```

### Android (AndroidManifest.xml)
Add these permissions to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

## Best Practices

1. **Always handle the callback**: Store the image path in state or upload immediately
2. **Show feedback**: Use the loading indicator to show progress
3. **Validate images**: Check file size and format before uploading
4. **Handle errors**: The service shows error messages automatically
5. **Test permissions**: Test on both iOS and Android devices
6. **Optimize quality**: Use appropriate `imageQuality` (85 is good balance)

## Common Use Cases

### Profile Picture Upload
```dart
ImageUploadWidget(
  width: 120,
  height: 120,
  initialImagePath: user.profileImageUrl,
  onImageSelected: (path) async {
    await uploadProfilePicture(path);
  },
)
```

### Post Image Selection
```dart
ImageUploadWidget(
  width: double.infinity,
  height: 250,
  onImageSelected: (path) {
    postController.addImage(path);
  },
)
```

### Document Upload
```dart
ImageUploadWidget(
  backgroundColor: Colors.grey.shade100,
  addButtonColor: Colors.green,
  onImageSelected: (path) {
    uploadDocument(path);
  },
)
```

## Troubleshooting

### Permission Denied
- Check platform configuration (Info.plist / AndroidManifest.xml)
- Test on real device (simulator may have issues)
- Clear app data and reinstall

### Image Not Showing
- Verify the path is correct
- Check if network image URL is accessible
- Ensure file exists at the path

### Dialog Not Appearing
- Check if Get.context is available
- Ensure GetMaterialApp is used in main.dart
- Verify no other dialogs are blocking

## Migration from Old Widget

If you were using `CameraUploadCard`:
```dart
// Old
CameraUploadCard(
  onTap: () {
    // Manual image picking
  },
)

// New
ImageUploadWidget(
  onImageSelected: (imagePath) {
    // Automatic handling with path
  },
)
```

The old `CameraUploadCard` is still available but deprecated.
