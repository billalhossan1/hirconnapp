import 'package:get/get.dart';

class PersonalPageDetailsController extends GetxController{
  RxInt age = 0.obs;

  void calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int calculatedAge = now.year - birthDate.year;
    if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
      calculatedAge--;
    }
    age.value = calculatedAge;
  }
  RxString selectedState = ''.obs;
  RxString selectedCountry = ''.obs;

  void setSelectedState(String state) {
    selectedState.value = state;
  }
  void setSelectedCountry(String country) {
    selectedCountry.value = country;
  }
}