import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyController.dart';
import 'package:just_delivery/screens/dashboard_screen/home_screen/home_controller.dart';
import 'package:just_delivery/screens/dashboard_screen/profile_screen/profile_controller.dart';
import 'package:just_delivery/screens/home_screen_live_tracking/live_tracking_home_controller.dart';
import '../home_screen_live_tracking/liveTracking/liveTrackingController.dart';

class BottomBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => LiveTrackingController(), fenix: true);
    Get.lazyPut(() => LiveTrackingHomeController(), fenix: true);
  }
}
