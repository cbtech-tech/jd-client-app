import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/theme_helper.dart';

class LoaderController extends GetxController {
  // Reactive variable for loading state
  var isLoading = false.obs;

  // Show the loader
  void showLoader() {
    isLoading.value = true;
  }

  // Hide the loader
  void hideLoader() {
    isLoading.value = false;
  }
}

//CustomLoaderWidget

class LoaderUtil {
  static void showLoader() {
    if (!Get.isDialogOpen!) {
      Get.dialog(
        PopScope(
          canPop: false,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CircularProgressIndicator(color: ThemeHelper().appColor,),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
  }

  static void hideLoader() {
    if (Get.isDialogOpen == true) {
      Navigator.of(Get.overlayContext!).pop();

    }
  }
}
