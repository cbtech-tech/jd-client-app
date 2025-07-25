import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/appBar.dart';
import 'package:just_delivery/customWidgets/customButtom.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';

import 'package:just_delivery/theme/theme_helper.dart';
import '../../utils/cus_textfield.dart';
import 'onboardingController2.dart';
import 'widgets/cus_stepper.dart';

class OnboardingScreens2 extends GetView<OnboardingController2> {
  const OnboardingScreens2({super.key});

  Widget _buildFilePreview({
    required Rx<File?> fileRx,
    required VoidCallback onPick,
    required VoidCallback onRemove,
    required String uploadText,
  }) {
    return Obx(() {
      final file = fileRx.value;
      if (file != null) {
        bool isImage = [
          'jpg',
          'jpeg',
          'png',
        ].any((ext) => file.path.toLowerCase().endsWith(ext));

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: PrimaryColors().gray60003),
          ),
          child: Row(
            children: [
              if (isImage)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    file,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Icon(
                  Icons.picture_as_pdf,
                  size: 50,
                  color: ThemeHelper().appColor,
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  file.path.split('/').last,
                  style: CustomTextStyle.body(color: PrimaryColors().black900),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Icon(Icons.close, size: 20),
                ),
              ),
            ],
          ),
        );
      } else {
        return GestureDetector(
          onTap: onPick,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: PrimaryColors().gray60003),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.upload_file, color: ThemeHelper().appColor),
                const SizedBox(width: 10),
                Text(
                  uploadText,
                  style: CustomTextStyle.body(color: ThemeHelper().appColor),
                ),
              ],
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Onboarding"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomStepper(currentStep: 1),
              SizedBox(height: 25),

              /// GST Applicable
              Text(
                "Is GST Applicable?".tr,
                style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: controller.isGstApplicable.value,
                      onChanged:
                          (value) => controller.isGstApplicable.value = value!,
                    ),
                    Text('Yes', style: CustomTextStyle.body()),
                    const SizedBox(width: 20),
                    Radio<bool>(
                      value: false,
                      groupValue: controller.isGstApplicable.value,
                      onChanged:
                          (value) => controller.isGstApplicable.value = value!,
                    ),
                    Text('No', style: CustomTextStyle.body()),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              /// GST Number + GST Certificate Upload
              Obx(
                () =>
                    controller.isGstApplicable.value
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              title: "GST Number".tr,
                              controller: controller.gstNumberController,
                              label: 'Enter GST Number',
                              keyboardType: TextInputType.text,
                            ),

                            const SizedBox(height: 20),

                            // GST Certificate upload with preview
                            _buildFilePreview(
                              fileRx: controller.gstCertificateFile,
                              onPick: () {
                                controller.pickGstCertificate();
                                log("Upload GST Certificate");
                              },
                              onRemove: () {
                                controller.removeGstCertificate();
                              },
                              uploadText: "Upload GST Certificate",
                            ),

                            const SizedBox(height: 20),
                          ],
                        )
                        : const SizedBox(),
              ),

              /// PAN Number
              ///
              ///
              CustomTextField(
                title: "PAN Number".tr,
                controller: controller.panNumberController,
                label: 'Enter PAN Number',
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 20),

              /// GST Certificate Example (Optional) Upload + Preview
              Text(
                "GST Exempt Certificate (Optional)",
                style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
              ),
              const SizedBox(height: 10),
              _buildFilePreview(
                fileRx: controller.gstExemptFile,
                onPick: () {
                  log("Upload GST Exempt Certificate (Optional)");
                  controller.pickGstExemptFile();
                },
                onRemove: () {
                  controller.removeGstExemptFile();
                },
                uploadText: "Upload GST Exempt Certificate (Optional)",
              ),

              const SizedBox(height: 50),

              CustomButton(text: "Next".tr, onTap: controller.next),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
