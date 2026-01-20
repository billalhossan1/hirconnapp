import 'package:get/get.dart';
import 'package:hirconn_app/screens/about_screen/controller/about_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/change_password_screen/controller/change_password_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/forgot_screen/controller/forgot_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/login_screen/controller/login_screen_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:hirconn_app/screens/auth_all_screens/sign_up_screen/controller/sign_up_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => ForgotScreenController());
    Get.lazyPut(() => OtpVerificationController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => ChangePasswordScreenController());
    Get.lazyPut(() => AboutScreenController());
  }
}
