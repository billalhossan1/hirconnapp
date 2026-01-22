import 'package:core_kit/core_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:hirconn_app/widgets/hirconn_app_widget/hirconn_app_widget.dart';

import '../../../constant/app_colors.dart';

class AboutScreenController extends GetxController {
  List<String> interestList = [
    "Technology",
    "Sports",
    "Music",
    "Travel",
    "Food",
    "Art",
    "Science",
    "History",
    "Literature",
    "Movies",
    "Fitness",
    "Gaming",
    "Photography",
    "Fashion",
    "Nature",
    "Entrepreneurship",
    "Freelancing",
    "Startups",
    "Small Business",
    "Remote Work",
    "Career Growth",
  ];
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

  RxBool isTermsAccepted = false.obs;
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

  void onTapNext() {
    ShowCustomDialog.showOneButtonDialog(
      primaryButtonText: 'Save',
      onPrimaryPressed: (){
        Get.offAllNamed(AppRoutes.instance.profileSuccessScreen);
      },
      crossAxisAlignment: .start,
      okButtonSticky: true,
      dialogHeight: 600.h,
      context: Get.context!,
      content: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              SizedBox.shrink(),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(CupertinoIcons.clear),
              ),
            ],
          ),
          20.height,
          HirconnHeaderText(title: 'Interests'),
          6.height,
          HirconnSecondaryText(text: "Select up to 5 interests"),
          20.height,
          CommonText(
            text: 'Career & Business',
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
        ],
      ),
    );
  }
}

class SelectItemCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  const SelectItemCard({
    super.key,
    required this.title,
    required this.isSelected, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.instance.border),
            borderRadius: BorderRadius.circular(4),
            color: isSelected ? AppColors.instance.primary : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonText(
              text: title,
              textColor: isSelected ? Colors.white:AppColors.instance.subTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedItemsValue {
  final String title;
  // make this reactive so changes are notified to Obx listeners
  RxBool isSelected;

  SelectedItemsValue({required this.title, bool isSelected = false}) : isSelected = isSelected.obs;
}
