import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/screens/onboarding_screens/onboarding_screen2.dart';

import '../../customWidgets/snackbar.dart';
import 'onboardingController2.dart';

class OnboardingController extends GetxController {
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController companyNumberController = TextEditingController();
  TextEditingController authorizedNameController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController registeredCompanyController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  RxString companyDesgintation = "".obs;

  static const List<String> list = [
    'Store Manager',
    'Assistant Store Manager',
    'Store Coordinator ',
    'Staff',
  ];

  void next() {
    if (companyEmailController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Company Email can't be empty");
      return;
    }

    // Email format validation
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(companyEmailController.text.trim())) {
      SnackbarUtil.showErrorTop("Please enter a valid email address");
      return;
    }

    if (companyNumberController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Company Number can't be empty");
      return;
    }

    if (authorizedNameController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Authorized Person Name can't be empty");
      return;
    }

    if (brandNameController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Brand Name can't be empty");
      return;
    }

    if (registeredCompanyController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Registered Company Name can't be empty");
      return;
    }

    if (companyDesgintation.value.isEmpty) {
      SnackbarUtil.showErrorTop("Please select your Designation");
      return;
    }
    final data = {
      'companyEmail': companyEmailController.text.trim(),
      'companyNumber': companyNumberController.text.trim(),
      'authorizedName': authorizedNameController.text.trim(),
      'brandName': brandNameController.text.trim(),
      'registeredCompany': registeredCompanyController.text.trim(),
      'designation': companyDesgintation.value,
    };

    Get.to(
      () => OnboardingScreens2(),
      arguments: data,
      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController2>(() => OnboardingController2());
      }),
    );
  }
}
