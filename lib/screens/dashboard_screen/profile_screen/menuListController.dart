import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:just_delivery/routes/app_routes.dart';
import 'package:just_delivery/utils/pref_utils.dart';

class MenuListController extends GetxController{


  RxInt selectedIndex = 0.obs;

  final List<String> options = ['all'.tr, 'completed'.tr, 'cancelled'.tr];
  final RxInt rating = 0.obs;
  final bool isEditable = true;

  Future<void> logout() async {
    PrefUtils().setIsLoggedIn(false);
    PrefUtils().setToken("");

    await Future.delayed(Duration(seconds: 1)); // Short delay

    Get.offAllNamed(AppRoutes.loginScreen); // Now navigates
  }

}