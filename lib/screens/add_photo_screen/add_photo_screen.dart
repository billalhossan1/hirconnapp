import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';
import 'package:hirconn_app/widgets/image_upload_widget/image_upload_widget.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
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
              HeaderTextFiled(text: 'Upload Photo'),
              CameraUploadCard(width: double.infinity, height: 380),
              HeaderTextFiled(text: 'tad'),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1,
                ),

                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => CameraUploadCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
