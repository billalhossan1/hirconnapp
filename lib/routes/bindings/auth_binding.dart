import 'package:get/get.dart';
import 'package:hirconn_app/screens/about_screen/controller/about_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/change_password_screen/controller/change_password_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/forgot_screen/controller/forgot_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/login_screen/controller/login_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/controller/sign_up_controller.dart';
import 'package:hirconn_app/screens/business_basic_screen/controller/business_basic_controller.dart';
import 'package:hirconn_app/screens/business_hours_screen/controller/business_hours_controller.dart';
import 'package:hirconn_app/screens/business_representive_screen/controller/business_representative_controller.dart';
import 'package:hirconn_app/screens/describe_your_business_screen/controller/describe_your_business_controller.dart';

import '../../screens/contact_information_screen/controller/contact_information_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => ForgotScreenController());
    Get.lazyPut(() => OtpVerificationController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => ChangePasswordScreenController());
    Get.lazyPut(() => AboutScreenController());
    Get.lazyPut(() => BusinessRepresentativeController());
    Get.lazyPut(() => BusinessBasicController());
    Get.lazyPut(() => DescribeYourBusinessController());
    Get.lazyPut(() => ContactInformationController());
    Get.lazyPut(() => BusinessHoursController());
  }
}
