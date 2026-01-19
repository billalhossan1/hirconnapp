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
      body: Column(
        children: [
          CommonText(
            text: 'Add Photo',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            textColor: AppColors.instance.primary,
          ),
          10.height,
          CommonText(
            text:
                'A profile photo helps people recognize you, build trust, and connect more easily',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            textColor: AppColors.instance.subTextColor,
          ),
          HeaderTextFiled(text: 'Upload Photo'),
          20.height,
          CameraUploadCard(

          )
        ],
      ),
    );
  }
}
