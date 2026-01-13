import 'package:flutter/material.dart';
import 'package:hirconn_app/app_all_enum/app_login_status.dart';
import 'package:hirconn_app/screens/app_navigation_screen/controller/app_navigation_screen_controller.dart';
import 'package:get/get.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppNavigationScreenController>(
      init: AppNavigationScreenController(),
      builder: (controller) {
        final screens = selectedAppUserType == AppUserType.user
            ? _getUserScreens()
            : _getBusinessScreens();

        final navItems = selectedAppUserType == AppUserType.user
            ? _getUserNavItems()
            : _getBusinessNavItems();

        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: controller.selectedIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.changeIndex,
            items: navItems,
          ),
        );
      },
    );
  }
  List<Widget> _getUserScreens() {
    // TODO: Add user screens here
    return [
      const Center(child: Text('Home')),
      const Center(child: Text('Search')),
      const Center(child: Text('Bookings')),
      const Center(child: Text('Messages')),
      const Center(child: Text('Favorites')),
      const Center(child: Text('Profile')),
    ];
  }

  List<BottomNavigationBarItem> _getUserNavItems() {
    // TODO: Customize user navigation items
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.black,),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search,color: Colors.black,),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today,color: Colors.black,),
        label: 'Bookings',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message,color: Colors.black,),
        label: 'Messages',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite,color: Colors.black,),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person,color: Colors.black,),
        label: 'Profile',
      ),
    ];
  }

  List<Widget> _getBusinessScreens() {
    // TODO: Add business screens here
    return [
      const Center(child: Text('Dashboard')),
      const Center(child: Text('Bookings')),
      const Center(child: Text('Messages')),
      const Center(child: Text('Analytics')),
      const Center(child: Text('Settings')),
    ];
  }

  List<BottomNavigationBarItem> _getBusinessNavItems() {
    // TODO: Customize business navigation items
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Bookings',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: 'Messages',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.analytics),
        label: 'Analytics',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
  }
}
