import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/appBar.dart';
import 'package:just_delivery/customWidgets/customButtom.dart';
import 'package:just_delivery/customWidgets/textStyle.dart';
import 'package:just_delivery/screens/onboarding_screens/widgets/cus_stepper.dart';
import 'package:just_delivery/theme/theme_helper.dart';
import '../../utils/cus_textfield.dart';
import 'onboarding_controller4.dart';

class OnboardingScreen4 extends GetView<OnboardingController4> {
  const OnboardingScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController4>();

    return Scaffold(
      appBar: CustomAppBar(text: "Onboarding"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomStepper(currentStep: 3),
              SizedBox(height: 25),

              // Pickup Location *
              CustomTextField(
                title: "Pickup Location*".tr,
                controller: controller.pickupLocationController,
                label: 'Enter Pickup Location',
                keyboardType: TextInputType.text,
              ),

              // Text(
              //   "Pickup Location*".tr,
              //   style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
              // ),
              // const SizedBox(height: 10),
              // TextField(
              //   controller: controller.pickupLocationController,
              //   decoration: InputDecoration(
              //     labelText: 'Enter Pickup Location',
              //     labelStyle: TextStyle(color: PrimaryColors().black900),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //   ),
              //   keyboardType: TextInputType.text,
              //   style: CustomTextStyle.body(color: PrimaryColors().black900),
              // ),
              const SizedBox(height: 20),

              // Drop Location *
              CustomTextField(
                title: "Drop Location*".tr,
                controller: controller.dropLocationController,
                label: 'Enter Drop Location',
                keyboardType: TextInputType.text,
              ),

              // Text(
              //   "Drop Location*".tr,
              //   style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
              // ),
              // const SizedBox(height: 10),
              // TextField(
              //   controller: controller.dropLocationController,
              //   decoration: InputDecoration(
              //     labelText: 'Enter Drop Location',
              //     labelStyle: TextStyle(color: PrimaryColors().black900),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //   ),
              //   keyboardType: TextInputType.text,
              //   style: CustomTextStyle.body(color: PrimaryColors().black900),
              // ),
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
              const SizedBox(height: 20),

              CustomTextField(
                title:
                    "KMs Run Per Day (Start and end location should be the same for calculation)",
                controller: controller.kmsPerDayController,
                label: 'Enter Estimated Daily KMs',
                keyboardType: TextInputType.number,
              ),

              // Text(
              //   "(Start and end location should be the same for calculation)",
              //   style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
              // ),
              // const SizedBox(height: 5),
              // TextField(
              //   controller: controller.kmsPerDayController,
              //   decoration: InputDecoration(
              //     labelText: 'Enter Estimated Daily KMs',
              //     labelStyle: TextStyle(color: PrimaryColors().black900),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //       borderSide: BorderSide(color: PrimaryColors().gray60003),
              //     ),
              //   ),
              //   keyboardType: TextInputType.number,
              //   style: CustomTextStyle.body(color: PrimaryColors().black900),
              // ),

              // const Spacer(),
              SizedBox(height: 50.0),

              // Next Button
              CustomButton(text: "Next".tr, onTap: () => controller.next()),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
