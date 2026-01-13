import 'package:hirconn_app/utils/error_log.dart';
import 'package:get/get.dart';

import '../../../app_all_enum/app_login_status.dart';

class AppNavigationScreenController extends GetxController {
  int selectedIndex = 0;


  void changeIndex(int index) {
    try {
      selectedIndex = index;
      update();
    } catch (e) {
      errorLog("changeIndex", e);
    }
  }
}
