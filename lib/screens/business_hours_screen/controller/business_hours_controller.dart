import 'package:get/get.dart';

class BusinessHoursController extends GetxController {
  // Keep track of whether each day is selected
  RxBool isSundaySelected = false.obs;
  RxBool isMondaySelected = false.obs;
  RxBool isTuesdaySelected = false.obs;
  RxBool isWednesdaySelected = false.obs;
  RxBool isThursdaySelected = false.obs;
  RxBool isFridaySelected = false.obs;
  RxBool isSaturdaySelected = false.obs;

  // Time selection for each day
  RxString sundayFrom = '09:00 AM'.obs;
  RxString sundayTo = '09:00 AM'.obs;
  RxString mondayFrom = '09:00 AM'.obs;
  RxString mondayTo = '09:00 AM'.obs;
  RxString tuesdayFrom = '09:00 AM'.obs;
  RxString tuesdayTo = '09:00 AM'.obs;
  RxString wednesdayFrom = '09:00 AM'.obs;
  RxString wednesdayTo = '09:00 AM'.obs;
  RxString thursdayFrom = '09:00 AM'.obs;
  RxString thursdayTo = '09:00 AM'.obs;
  RxString fridayFrom = '09:00 AM'.obs;
  RxString fridayTo = '09:00 AM'.obs;
  RxString saturdayFrom = '09:00 AM'.obs;
  RxString saturdayTo = '09:00 AM'.obs;
}
