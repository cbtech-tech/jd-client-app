import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../customWidgets/snackbar.dart';
import 'onboarding_controller4.dart';
import 'onboarding_screen4.dart';

class OnboardingController3 extends GetxController {
  final accountantNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  late Map<String, dynamic> onboardingData;




  @override
  void onInit() {
    super.onInit();
    onboardingData = Map<String, dynamic>.from(Get.arguments ?? {});
  }


  void next() {



    if(accountantNameController.text.trim().isEmpty) {
      SnackbarUtil.showErrorTop("Please enter Accountant Name");
      return;
    }
    if(phoneNumberController.text.trim().isEmpty) {
      SnackbarUtil.showErrorTop("Please enter Phone Number");
      return;
    }
    if(emailController.text.trim().isEmpty) {
      SnackbarUtil.showErrorTop("Please enter Email Address");
      return;
    }
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(emailController.text.trim())) {
      SnackbarUtil.showErrorTop("Please enter a valid email address");
      return;
    }
    // Add email format validation if you want

    onboardingData.addAll({
      'accountantName': accountantNameController.text.trim(),
      'phoneNumber': phoneNumberController.text.trim(),
      'email': emailController.text.trim(),
    });
    Get.to(
          () => OnboardingScreen4(),
      arguments: onboardingData,

      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController4>(() => OnboardingController4());
      }),
    );



    // Proceed to next screen or logic here
  }

  @override
  void onClose() {
    accountantNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
