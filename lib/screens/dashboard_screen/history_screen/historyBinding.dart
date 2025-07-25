import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyController.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
