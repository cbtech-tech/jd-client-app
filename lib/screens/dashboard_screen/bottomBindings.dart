import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyController.dart';
import 'package:just_delivery/screens/dashboard_screen/profile_screen/menuListController.dart';

import 'home_screen/homeController.dart';
import 'home_screen/liveTracking/liveTrackingController.dart';

class BottomBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(()=>HistoryController());
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>MenuListController());
    Get.lazyPut(()=>LiveTrackingController());

  }





}