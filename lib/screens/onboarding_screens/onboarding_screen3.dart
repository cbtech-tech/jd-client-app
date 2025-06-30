import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/appBar.dart';
import 'package:just_delivery/customWidgets/customButtom.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:just_delivery/theme/theme_helper.dart';

import 'onboarding_controller3.dart';

class OnboardingScreen3 extends GetView<OnboardingController3> {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController3>();

    return Scaffold(
      appBar: CustomAppBar(text: "Onboarding"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Accountant Details (Invoices will be shared here)".tr,
              style: CustomTextStyle.subHeading(color: ThemeHelper().appColor,fontSize: 15),
            ),
            const SizedBox(height: 20),

            //Accountant Details (Invoices will be shared here)
            // Accountant Name *
            Text(
              "Accountant Name*".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.accountantNameController,
              decoration: InputDecoration(
                labelText: 'Enter Accountant Name',
                labelStyle: TextStyle(color: PrimaryColors().black900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
              ),
              keyboardType: TextInputType.name,
              style: CustomTextStyle.body(color: PrimaryColors().black900),
            ),

            const SizedBox(height: 20),

            // Phone Number *
            Text(
              "Phone Number*".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                labelStyle: TextStyle(color: PrimaryColors().black900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
              ),
              keyboardType: TextInputType.phone,
              style: CustomTextStyle.body(color: PrimaryColors().black900),
            ),

            const SizedBox(height: 20),

            // Email Address *
            Text(
              "Email Address*".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Enter Email Address',
                labelStyle: TextStyle(color: PrimaryColors().black900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: PrimaryColors().gray60003),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: CustomTextStyle.body(color: PrimaryColors().black900),
            ),

            const SizedBox(height: 30),
            const Spacer(),

            // Next Button
            CustomButton(
              text: "Next".tr,
              onTap: controller.next,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
