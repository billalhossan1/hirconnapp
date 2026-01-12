import 'package:get/get.dart';
import 'package:hirconn_app/screens/about_us_screen/controller/about_us_screen_controller.dart';
import 'package:hirconn_app/screens/app_navigation_screen/controller/app_navigation_screen_controller.dart';
import 'package:hirconn_app/screens/privacy_policy_screen/controller/privacy_policy_screen_controller.dart';
import 'package:hirconn_app/screens/terms_and_conditions_screen/controller/terms_and_conditions_screen_controller.dart';

class NavigationScreenBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(() => AppNavigationScreenController());
    Get.lazyPut(() => TermsAndConditionsScreenController());
    Get.lazyPut(() => PrivacyPolicyScreenController());
    Get.lazyPut(() => AboutUsScreenController());
  }
}
