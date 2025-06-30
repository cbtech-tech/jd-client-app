import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/constants/api_constants.dart';

import '../../api/api_service.dart';
import '../../customWidgets/customLoader.dart';
import '../../customWidgets/snackbar.dart';
import '../login_screen/otpResponseModel.dart';

class OnboardingController4 extends GetxController {
  final pickupLocationController = TextEditingController();
  final dropLocationController = TextEditingController();
  final kmsPerDayController = TextEditingController();

  late Map<String, dynamic> onboardingData;


  final ApiService apiService = Get.find();


  @override
  void onInit() {
    super.onInit();
    onboardingData = Map<String, dynamic>.from(Get.arguments ?? {});
  }

  void next() {
    if (pickupLocationController.text.trim().isEmpty) {
      SnackbarUtil.showErrorTop("Please enter Pickup Location");
      return;
    }
    if (dropLocationController.text.trim().isEmpty) {
      SnackbarUtil.showErrorTop("Please enter Drop Location");
      return;
    }
    if (kmsPerDayController.text.trim().isEmpty) {
      SnackbarUtil.showErrorTop("Please enter estimated KMs per day");
      return;
    }

    onboardingData.addAll({
      'pickupLocation': pickupLocationController.text.trim(),
      'dropLocation': dropLocationController.text.trim(),
      'kmsPerDay': kmsPerDayController.text.trim(),
    });


    submitAllData();


    // Proceed to next screen or logic
    // Get.to(() => NextScreen());
  }


  Future<void> submitAllData() async {
    // Here you have ALL data merged from previous controllers

    // Now you can use the full data to call your API or save in database
    print("All onboarding data:");
    print(onboardingData);


    final fields = <String, String>{
      'companyEmail': '${onboardingData['companyEmail'] ?? ''}',
      'companyNumber': '${onboardingData['companyNumber'] ?? ''}',
      'authorizedName': '${onboardingData['authorizedName'] ?? ''}',
      'brandName': '${onboardingData['brandName'] ?? ''}',
      'registeredCompany': '${onboardingData['registeredCompany'] ?? ''}',
      'designation': '${onboardingData['designation'] ?? ''}',
      'gstNumber': '${onboardingData['gstNumber'] ?? ''}',
      'panNumber': '${onboardingData['panNumber'] ?? ''}',
      'accountantName': '${onboardingData['accountantName'] ?? ''}',
      'phoneNumber': '${onboardingData['phoneNumber'] ?? ''}',
      'email': '${onboardingData['email'] ?? ''}',
      'pickupLocation': '${onboardingData['pickupLocation'] ?? ''}',
      'dropLocation': '${onboardingData['dropLocation'] ?? ''}',
      'kmsPerDay': '${onboardingData['kmsPerDay'] ?? ''}',
    };

    Map<String, File> files = {};

    if (onboardingData['gstCertificateFile'] != null && onboardingData['gstCertificateFile'] is File) {
      files['gstCertificateFile'] = onboardingData['gstCertificateFile'];
    }

    if (onboardingData['gstExemptFile'] != null && onboardingData['gstExemptFile'] is File) {
      files['gstExemptJotFile'] = onboardingData['gstExemptFile'];
    }
    LoaderUtil.showLoader();


    final response = await apiService.postMultipart(ApiConstants().setUserInformation, fields, files);

    if (response.isSuccess) {

      var loginModel = OtpResponseModel.fromJson(response.data);

      if(loginModel.success??false)
      {
        SnackbarUtil.showSuccessBottom("Registered Successfully");
        LoaderUtil.hideLoader();


      }
      else
        {
          LoaderUtil.hideLoader();
          SnackbarUtil.showErrorTop(response.error ?? 'Something went wrong');

        }


    }
    else {

      LoaderUtil.hideLoader();

      SnackbarUtil.showErrorTop(response.error ?? 'Something went wrong');
    }



    // Example: Submit via API...
  }

  @override
  void onClose() {
    pickupLocationController.dispose();
    dropLocationController.dispose();
    kmsPerDayController.dispose();
    super.onClose();
  }
}
