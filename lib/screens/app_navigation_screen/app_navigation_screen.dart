import 'package:flutter/material.dart';
import 'package:hirconn_app/app_all_enum/app_login_status.dart';
import 'package:hirconn_app/screens/app_navigation_screen/controller/app_navigation_screen_controller.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/screens/app_navigation_screen/widgets/custom_bottom_nav_bar.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppNavigationScreenController>(
      init: AppNavigationScreenController(),
      builder: (controller) {
        final screens = selectedAppUserType == AppUserType.user
            ?_getUsersScreens(): _getBusinessScreens()
        ;

        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: controller.selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.changeIndex,
          ),
        );
      },
    );
  }

  List<Widget> _getBusinessScreens() {
    // TODO: Add user screens here
    return [
      const Center(child: Text('Home')),
      const Center(child: Text('Search')),
      const Center(child: Text('Bookings')),
      const Center(child: Text('Messages')),
      const Center(child: Text('Favorites')),
    ];
  }

  List<Widget> _getUsersScreens() {
    // TODO: Add business screens here
    return [
      const Center(child: Text('Home')),
      const Center(child: Text('Bookings')),
      const Center(child: Text('Messages')),
      const Center(child: Text('Analytics')),
      const Center(child: Text('Settings')),
      const Center(child: Text('Profile')),
    ];
  }
}
