import 'package:core_kit/core_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../widgets/custom_alert_dialog/custom_alert_dialog.dart';
import '../../../widgets/hirconn_app_widget/hirconn_app_widget.dart';
import '../../about_screen/controller/about_screen_controller.dart';
import '../../auth_all_screens/sign_up_screen/personal_page_details_screen/personal_page_details_screen.dart';

class BusinessBasicController extends GetxController{
  RxBool isYesSelected = false.obs;
  RxBool isBusinessRegistered = false.obs;
  // Use RxnBool so the observable can hold a nullable boolean (true/false/null)
  RxnBool isBusinessInsured = RxnBool();
  RxBool isBusinessNotRequired = false.obs;


  RxnBool isLocationFixed = RxnBool();
  RxBool isOnlineLocation = false.obs;

  RxnBool haveLicense = RxnBool();
  RxBool isNotRequiredLicense = false.obs;

  RxString selectedState = ''.obs;
  RxString selectedCity = ''.obs;
  RxList<SelectedItemsValue> businessStructureList = RxList<SelectedItemsValue>([
    SelectedItemsValue(title: "Sole Proprietorship", isSelected: false),
    SelectedItemsValue(title: "Partnership", isSelected: false),
    SelectedItemsValue(title: "Incorporated (e.g. LLC)", isSelected: false),
    SelectedItemsValue(title: "Others", isSelected: false),
  ]);
  RxList<SelectedItemsValue> engagementTypeList = RxList<SelectedItemsValue>([
    SelectedItemsValue(title: "Walk-in", isSelected: false),
    SelectedItemsValue(title: "Online", isSelected: false),
    SelectedItemsValue(title: "Delivery", isSelected: false),
    SelectedItemsValue(title: "Project-based", isSelected: false),
    SelectedItemsValue(title: "Event-based", isSelected: false),
    SelectedItemsValue(title: "In-store pickup", isSelected: false),
    SelectedItemsValue(title: "Subscription/Retainer", isSelected: false),
    SelectedItemsValue(title: "In-store pickup", isSelected: false),
    SelectedItemsValue(title: "Quote required", isSelected: false),
  ]);
  RxList<String> selectedInterests = RxList<String>([]);
  void removeInterest(String interest) {
    selectedInterests.remove(interest);
  } // Add interest

  void addInterest(String interest) {
    if (interest.trim().isNotEmpty &&
        !selectedInterests.contains(interest.trim())) {
      selectedInterests.add(interest.trim());
    }
  }
  RxList<SelectedItemsValue> selectedItems = RxList<SelectedItemsValue>([
    SelectedItemsValue(title: "Legal Services", isSelected: false),
    SelectedItemsValue(title: "Accounting & Bookkeeping", isSelected: false),
    SelectedItemsValue(title: "Financial Advisory", isSelected: false),
    SelectedItemsValue(title: "Consulting", isSelected: false),
    SelectedItemsValue(title: "Compliance & Risk", isSelected: false),
    SelectedItemsValue(title: "Compliance & Risk", isSelected: false),
    SelectedItemsValue(title: "Human Resources", isSelected: false),
    SelectedItemsValue(title: "Science", isSelected: false),
    SelectedItemsValue(title: "History", isSelected: false),
    SelectedItemsValue(title: "Literature", isSelected: false),
    SelectedItemsValue(title: "Movies", isSelected: false),
    SelectedItemsValue(title: "Fitness", isSelected: false),
    SelectedItemsValue(title: "Gaming", isSelected: false),
    SelectedItemsValue(title: "Photography", isSelected: false),
  ]);


  void onTapSelect() {
    ShowCustomDialog.showOneButtonDialog(
      primaryButtonText: 'Save',
      onPrimaryPressed: (){
        Get.back();
        // Get.offAllNamed(AppRoutes.instance.profileSuccessScreen);
      },
      crossAxisAlignment: .start,
      okButtonSticky: true,
      dialogHeight: 600.h,
      context: Get.context!,
      content: Column(
        crossAxisAlignment: .start,
        children: [

          HirconnHeaderText(title: 'Select a category that best describes your business',),
          6.height,
          HirconnSecondaryText(text: "This helps your business appear in relevant searches"),
          20.height,
          CommonText(
            text: 'Professional Services',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          10.height,
          ListView.builder(
            itemBuilder: (context, index) => Obx(() => SelectItemCard(
              onTap: () {
                // toggle the reactive bool value so Obx rebuilds immediately
                selectedItems[index].isSelected.value = !selectedItems[index].isSelected.value;
              },
              title: selectedItems[index].title,
              isSelected: selectedItems[index].isSelected.value,
            )),
            itemCount: selectedItems.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),

          HeaderText(text: 'Other'),
          10.height,
          CommonMultilineTextField(validationType: ValidationType.validateRequired,hintText: 'Describe your business here...',borderColor: Colors.white,),
        ],
      ),
    );
  }
}