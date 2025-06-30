import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/profile_screen/menuListScreen.dart';
import 'package:just_delivery/theme/theme_helper.dart';

import 'history_screen/historyScreen.dart';
import 'homeBottomController.dart';
import 'home_screen/homeScreen.dart';

class HomeBottomScreen extends StatelessWidget {
  final HomeBottomController navController = Get.put(HomeBottomController());

  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text('Coming Soon')),
    HistoryScreen(),
    MenuListScreen(),
  ];

   HomeBottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[navController.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              currentIndex: navController.selectedIndex.value,
              onTap: navController.changeTab,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: ThemeHelper().appColor,
              unselectedItemColor: Colors.black,
              elevation: 0, // Prevent default shadow
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Order'),
                BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
