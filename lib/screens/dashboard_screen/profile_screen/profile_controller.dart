import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_delivery/routes/app_routes.dart';
import 'package:just_delivery/utils/pref_utils.dart';

import '../../../theme/theme_helper.dart';

class ProfileController extends GetxController {
  void logout() {
    Get.defaultDialog(
      title: "Logout",
      titleStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      middleText: "Are you sure you want to logout?",
      textCancel: "No",
      textConfirm: "Yes",
      cancelTextColor: ThemeHelper().appColor,
      buttonColor: ThemeHelper().appColor,

      // onCancel: () {
      //   // Get.back(); // No press - just close
      // },
      onConfirm: () async {
        await PrefUtils().clearAllPreferences();
        await Future.delayed(Duration(seconds: 1));
        Get.offAllNamed(AppRoutes.loginScreen);
      },
    );
  }

  // Future<void> logout() async {
  //   await PrefUtils().clearAllPreferences();

  //   await Future.delayed(Duration(seconds: 1)); // Short delay

  //   Get.offAllNamed(AppRoutes.loginScreen); // Now navigates
  // }
}
