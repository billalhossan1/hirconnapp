// USAGE EXAMPLE - This file demonstrates how to use ReactiveCheckBox
// You can delete this file after understanding the usage pattern

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/widgets/reactive_checkbox_widget.dart';

// Example Controller
class ExampleController extends GetxController {
  final haveLicense = Rxn<bool>(); // Nullable bool
  final isNotRequiredLicense = false.obs;
}

// Example Usage in Widget
class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExampleController>();

    return Column(
      children: [
        // BEFORE (Old way - verbose and repetitive):
        // Obx(
        //   () => CommonCheckBox(
        //     isChecked: controller.haveLicense.value == false,
        //     onChanged: (val) {
        //       controller.haveLicense.value = false;
        //       controller.isNotRequiredLicense.value = false;
        //     },
        //     text: 'Not yet',
        //     checkBorderColor: AppColors.instance.dark500,
        //     textColor: controller.haveLicense.value == false
        //         ? AppColors.instance.primary
        //         : AppColors.instance.dark400,
        //   ),
        // ),

        // AFTER (New way - clean and reusable):
        ReactiveCheckBox(
          isChecked: (controller.haveLicense.value == false).obs,
          onChanged: (val) {
            controller.haveLicense.value = false;
            controller.isNotRequiredLicense.value = false;
          },
          text: 'Not yet',
        ),

        // Another example:
        ReactiveCheckBox(
          isChecked: (controller.haveLicense.value == true).obs,
          onChanged: (val) {
            controller.haveLicense.value = true;
            controller.isNotRequiredLicense.value = false;
          },
          text: 'Yes, I have relevant licenses/certifications',
        ),

        ReactiveCheckBox(
          isChecked: controller.isNotRequiredLicense,
          onChanged: (val) {
            controller.isNotRequiredLicense.value = true;
            controller.haveLicense.value = null;
          },
          text: 'Not required for my business',
        ),
      ],
    );
  }
}
