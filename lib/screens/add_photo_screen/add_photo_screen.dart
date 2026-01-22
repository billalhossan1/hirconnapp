import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/add_photo_screen/controller/add_photo_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_account/personal_page_account.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';
import 'package:hirconn_app/widgets/image_upload_widget/image_upload_widget.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddPhotoScreenController controller =
        Get.find<AddPhotoScreenController>();

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: controller.isFromBusiness
                    ? 'Show your business'
                    : 'Add Photo',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                textColor: AppColors.instance.primary,
              ),
              10.height,
              CommonText(
                textAlign: .start,
                isDescription: true,
                text: controller.isFromBusiness
                    ? 'Images help people recognize your brand, and trust your work'
                    : 'A profile photo helps people recognize you, build trust, and connect more easily',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: AppColors.instance.subTextColor,
              ),
              20.height,

              HeaderText(
                text: controller.isFromBusiness
                    ? 'Business logo or banner'
                    : 'Main Photo',
              ),
              HirconnSecondaryText(
                text: 'This image appears at the top of your business page',
                fontSize: 12,
              ),
              controller.isFromBusiness ? 10.height : 4.height,
              Obx(
                () => ImageUploadWidget(
                  width: double.infinity,
                  height: 380,
                  initialImagePath: controller.profilePhoto.value,
                  onImageSelected: controller.updateProfilePhoto,
                ),
              ),

              20.height,
              HeaderText(
                text: controller.isFromBusiness
                    ? 'Work Samples (optional) '
                    : 'More Photos',
                showStar: false,
              ),
              4.height,
              CommonText(
                text: controller.isFromBusiness
                    ? 'Add images that show your work. You can update this anytime'
                    : 'Optional - show more of you',
                fontSize: 14,
                textColor: AppColors.instance.subTextColor,
              ),
              10.height,

              GridView.builder(
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
             controller.isFromBusiness? 20.height: SizedBox.shrink(),
              controller.isFromBusiness? CommonCheckBoxMultiline(
                isTermsAccepted: true,
                firstSecondaryText: 'By completing sign-up, you agree to the ',
                secondSecondaryText:
                    ', and acknowledge that your personal information will be processed as described in the ',
                firstMainText: 'Terms of Service',
                secondMainText: 'Privacy Notice.',
                onChanged: (val) {},
                onTapFirstMainText: (){},
                onTapSecondMainText: (){},
              ):SizedBox.shrink(),

              30.height,

              // Submit/Next Button
              Center(
                child: CommonButton(
                  onTap: controller.submitPhotos,
                  titleText: controller.isFromBusiness?'Complete Business Page':'Next',
                ),
              ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
