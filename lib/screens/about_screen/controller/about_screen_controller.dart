import 'package:get/get.dart';

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
}
