import 'package:get/get.dart';

import 'loginController.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>LoginController());
  }



}