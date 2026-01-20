import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/add_photo_screen/controller/add_photo_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/widgets/image_upload_widget/image_upload_widget.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPhotoScreenController());

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: 'Add Photo',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                textColor: AppColors.instance.primary,
              ),
              10.height,
              CommonText(
                isDescription: true,
                text:
                    'A profile photo helps people recognize you, build trust, and connect more easily',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                textColor: AppColors.instance.subTextColor,
              ),
              20.height,

              const HeaderTextFiled(text: 'Upload Photo'),
              Obx(
                () => ImageUploadWidget(
                  width: double.infinity,
                  height: 380,
                  initialImagePath: controller.profilePhoto.value,
                  onImageSelected: controller.updateProfilePhoto,
                ),
              ),

              20.height,
              const HeaderTextFiled(text: 'More Photos', showStar: false),
              4.height,

              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 1,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) => ImageUploadWidget(
                    width: double.infinity,
                    height: double.infinity,
                    initialImagePath: controller.galleryPhotos[index],
                    onImageSelected: (path) =>
                        controller.updateGalleryPhoto(index, path),
                  ),
                ),
              ),

              30.height,

              // Submit/Next Button
              CommonButton(onTap: controller.submitPhotos, titleText: 'Next'),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
