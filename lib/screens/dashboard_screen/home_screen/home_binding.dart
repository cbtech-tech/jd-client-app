import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/home_screen/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => HomeController());
  }
}
