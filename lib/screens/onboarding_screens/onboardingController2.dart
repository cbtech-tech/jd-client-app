import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../customWidgets/snackbar.dart';
import 'onboarding_controller3.dart';
import 'onboarding_screen3.dart';

class OnboardingController2 extends GetxController {
  RxBool isGstApplicable = true.obs;

  TextEditingController gstNumberController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();

  Rx<File?> gstCertificateFile = Rx<File?>(null);
  Rx<File?> gstExemptFile = Rx<File?>(null);

  late Map<String, dynamic> onboardingData;

  @override
  void onInit() {
    super.onInit();
    onboardingData = Map<String, dynamic>.from(Get.arguments ?? {});
  }

  void pickGstCertificate() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      gstCertificateFile.value = File(result.files.single.path!);
    }
  }

  void pickGstExemptFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      gstExemptFile.value = File(result.files.single.path!);
    }
  }

  void removeGstCertificate() {
    gstCertificateFile.value = null;
  }

  void removeGstExemptFile() {
    gstExemptFile.value = null;
  }

  void next() {
    if (isGstApplicable.value && gstNumberController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Please enter GST number");
      return;
    }

    if (isGstApplicable.value &&
        gstCertificateFile.value == null &&
        gstExemptFile.value == null) {
      SnackbarUtil.showErrorTop("Please upload either GST certificate or exemption proof");
      return;
    }

    if (panNumberController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Please enter PAN number");
      return;
    }

    onboardingData.addAll({
      'gstNumber': gstNumberController.text.trim(),
      'panNumber': panNumberController.text.trim(),
      if (gstCertificateFile.value != null) ...{
        'gstCertificatePath': gstCertificateFile.value!.path,
        'gstCertificateFile': gstCertificateFile.value,
      },
      if (gstExemptFile.value != null) ...{
        'gstExemptFilePath': gstExemptFile.value!.path,
        'gstExemptFile': gstExemptFile.value,
      }
    });

    Get.to(
          () => OnboardingScreen3(),
      arguments: onboardingData,
      binding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController3>(() => OnboardingController3());
      }),
    );
  }
}
