import 'package:get/get.dart';

import '../../about_screen/controller/about_screen_controller.dart';

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
}