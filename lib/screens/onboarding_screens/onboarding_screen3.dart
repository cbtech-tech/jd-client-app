import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/appBar.dart';
import 'package:just_delivery/customWidgets/customButtom.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:just_delivery/screens/onboarding_screens/widgets/cus_stepper.dart';
import 'package:just_delivery/theme/theme_helper.dart';

import '../../utils/cus_textfield.dart';
import 'onboarding_controller3.dart';

class OnboardingScreen3 extends GetView<OnboardingController3> {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController3>();

    return Scaffold(
      appBar: CustomAppBar(text: "Onboarding"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomStepper(currentStep: 2),
              SizedBox(height: 25.0),
              Text(
                "Accountant Details (Invoices will be shared here)".tr,
                style: CustomTextStyle.subHeading(
                  color: ThemeHelper().appColor,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),

              //Accountant Details (Invoices will be shared here)
              // Accountant Name *
              CustomTextField(
                title: "Accountant Name*".tr,
                controller: controller.accountantNameController,
                label: 'Enter Accountant Name',
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 20),

              // Phone Number *
              CustomTextField(
                title: "Phone Number*".tr,
                controller: controller.phoneNumberController,
                label: 'Enter Phone Number',
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 20),

              // Email Address *
              CustomTextField(
                title: "Email Address*".tr,
                controller: controller.emailController,
                label: 'Enter Email Address',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 30),

              // Next Button
              CustomButton(text: "Next".tr, onTap: controller.next),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
