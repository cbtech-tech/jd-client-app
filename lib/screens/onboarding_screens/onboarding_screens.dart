import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/appBar.dart';
import 'package:just_delivery/screens/onboarding_screens/onboarding_controller.dart';
import 'package:just_delivery/screens/onboarding_screens/widgets/cus_stepper.dart';
import 'package:just_delivery/utils/cus_textfield.dart';

import '../../customWidgets/customButtom.dart';
import '../../customWidgets/textStyle.dart';
import '../../theme/theme_helper.dart';

class OnboardingScreens extends GetView<OnboardingController> {
  const OnboardingScreens({super.key});

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
              CustomStepper(currentStep: 0),
              //name
              SizedBox(height: 25),

              CustomTextField(
                title: "Registered Company Name ".tr,
                controller: controller.registeredCompanyController,
                label: 'Enter registered company name',
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 20),
              CustomTextField(
                title: "Brand Name".tr,
                controller: controller.brandNameController,
                label: 'Enter Brand Name',
                keyboardType: TextInputType.name,
              ),

              /// Authorized Name
              const SizedBox(height: 20),
              CustomTextField(
                title: "Authorized Name".tr,
                controller: controller.authorizedNameController,
                label: 'Enter Authorized Name',
                keyboardType: TextInputType.name,
              ),

              //desgination
              const SizedBox(height: 20),

              Text(
                "Designation".tr,
                style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
              ),
              const SizedBox(height: 10),

              CustomDropdown<String>.search(
                hintText: 'Select Designation',

                items: OnboardingController.list,
                excludeSelected: false,
                decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(
                    color: PrimaryColors().gray60003,
                    width: 1,
                  ),
                  expandedBorder: Border.all(
                    color: PrimaryColors().gray60003,
                    width: 1,
                  ),
                  closedFillColor:
                      Colors
                          .transparent, // or use a background color if desired
                  hintStyle: CustomTextStyle.body(
                    color: PrimaryColors().black900,
                  ),
                  listItemStyle: CustomTextStyle.body(
                    color: PrimaryColors().black900,
                  ),
                ),
                onChanged: (value) {
                  log('changing value to: $value');
                  controller.companyDesgintation.value = value ?? "";
                },
              ),

              const SizedBox(height: 20),

              CustomTextField(
                title: "Contact Number*".tr,
                controller: controller.companyNumberController,
                label: 'Enter Company Number',
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 20),

              //email
              CustomTextField(
                title: "Email".tr,
                controller: controller.companyEmailController,
                label: 'Enter Company Email',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: ThemeHelper().appColor),
                    Text(
                      "Add manual Address".tr,
                      style: CustomTextStyle.body(
                        color: ThemeHelper().appColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                title: "address".tr,
                controller: controller.addressController,
                label: 'Enter Address',
                keyboardType: TextInputType.streetAddress,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                title: "pincode".tr,
                controller: controller.pincodeController,
                label: 'Enter Pincode',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),

              CustomButton(text: "next".tr, onTap: controller.next),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
