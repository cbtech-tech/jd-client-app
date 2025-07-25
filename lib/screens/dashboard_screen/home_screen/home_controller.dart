import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/constants/api_constants.dart';
import 'package:just_delivery/screens/dashboard_screen/home_screen/home_model.dart';
import 'package:just_delivery/theme/theme_helper.dart';

import '../../../api/api_service.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/pref_utils.dart';

class HomeController extends GetxController {
  final ApiService apiService = Get.find();

  RxList<Datum> deliveryList = <Datum>[].obs;

  RxBool isLoading = true.obs;
  ConsignmentModel? consignmentModel;

  @override
  void onInit() {
    super.onInit();
    fetchTodaysData(); // Call API when controller initializes
  }

  Future<void> fetchTodaysData() async {
    isLoading.value = true;
    try {
      final response = await apiService.getRequest(ApiConstants().getTodayData);

      if (response.isSuccess) {
        log("ResponseData===>>>${response.data}");

        consignmentModel = ConsignmentModel.fromJson(response.data);

        if (consignmentModel?.status ?? false) {
          deliveryList.assignAll(consignmentModel?.data ?? []);
        } else {
          deliveryList.clear();
        }
        // deliveryList.value = response.data['data'];
      } else {
        print("No data");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    Get.defaultDialog(
      title: "Logout",
      titleStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      middleText: "Are you sure you want to logout?",
      textCancel: "No",
      textConfirm: "Yes",
      cancelTextColor: ThemeHelper().appColor,
      buttonColor: ThemeHelper().appColor,
      onConfirm: () async {
        await PrefUtils().clearAllPreferences();
        await Future.delayed(Duration(seconds: 1));
        Get.offAllNamed(AppRoutes.loginScreen);
      },
    );
  }
}
