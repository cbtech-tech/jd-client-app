import 'package:get/get.dart';

import 'live_tracking_home_controller.dart';

class LiveTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveTrackingHomeController(),);
  }
}
