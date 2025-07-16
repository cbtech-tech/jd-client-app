import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyController.dart';

import 'history_details_controller.dart';

class HistoryDetailsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(()=>HistoryDetailsController());
  }


}