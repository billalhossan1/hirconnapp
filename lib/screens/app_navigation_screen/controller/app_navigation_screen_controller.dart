import 'package:hirconn_app/utils/error_log.dart';
import 'package:get/get.dart';

import '../../../app_all_enum/app_login_status.dart';

class AppNavigationScreenController extends GetxController {
  int selectedIndex = 0;
  bool isFromBusiness = false;
  @override
  void onInit() {
    // Ensure a default value is set explicitly. The previous code used '=='
    // which is a comparison and does nothing. Use assignment '=' to set the
    // default app user type if you need one here.
    isFromBusiness = Get.arguments['fromBusiness'] ?? false;
    selectedAppUserType =
        isFromBusiness ? AppUserType.business : AppUserType.user;
    super.onInit();
  }

  /// Set the global selected app user type and rebuild the UI that depends on it.
  ///
  /// Call this from anywhere (for example after login or when switching mode):
  /// Get.find<AppNavigationScreenController>().setAppUserType(AppUserType.user);
  void setAppUserType(AppUserType type) {
    selectedAppUserType = type;
    // trigger rebuild of GetBuilder widgets that use this controller
    update();
  }

  void changeIndex(int index) {
    try {
      selectedIndex = index;
      update();
    } catch (e) {
      errorLog("changeIndex", e);
    }
  }
}
