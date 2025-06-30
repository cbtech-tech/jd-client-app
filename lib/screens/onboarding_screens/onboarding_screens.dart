import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/appBar.dart';
import 'package:just_delivery/screens/onboarding_screens/onboarding_controller.dart';

import '../../customWidgets/customButtom.dart';
import '../../customWidgets/textStyle.dart';
import '../../theme/theme_helper.dart';

class OnboardingScreens extends GetView<OnboardingController>{


  const OnboardingScreens({super.key});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(text: "Onboarding"),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            //name
            Text(
              "Registered Company Name ".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: controller.registeredCompanyController,
              decoration: InputDecoration(
                labelText: 'Enter registered company name',
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


            ///brand name

            Text(
              "Brand Name".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),

            TextField(
               controller: controller.brandNameController,
              decoration: InputDecoration(
                labelText: 'Enter Brand Name',
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


            /// Authorized Name
            const SizedBox(height: 20),


            Text(
              "Authorized Name".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),

            TextField(
               controller: controller.authorizedNameController,
              decoration: InputDecoration(
                labelText: 'Enter Authorized Name',
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
                closedBorder: Border.all(color: PrimaryColors().gray60003, width: 1),
                expandedBorder: Border.all(color: PrimaryColors().gray60003, width: 1),
                closedFillColor: Colors.transparent, // or use a background color if desired
                hintStyle: CustomTextStyle.body(color: PrimaryColors().black900),
                listItemStyle: CustomTextStyle.body(color: PrimaryColors().black900),
              ),
              onChanged: (value) {
                log('changing value to: $value');
               controller. companyDesgintation.value = value??"";
              },
            ),

            const SizedBox(height: 20),

            // company number
            Text(
              "Contact Number*".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),

            TextField(
               controller: controller.companyNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Company Number',
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

            //email
            Text(
              "Email".tr,
              style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
            ),
            const SizedBox(height: 10),

            TextField(
               controller: controller.companyEmailController,
              decoration: InputDecoration(
                labelText: 'Enter Company Email',
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

          /*  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add,color: ThemeHelper().appColor,),
                  Text(
                    "Add manual Address".tr,
                    style: CustomTextStyle.body(color: ThemeHelper().appColor),
                  ),
                ],
              ),
            ),*/

            Spacer(),

            CustomButton(
              text: "next".tr,
              onTap: controller.next,
            ),


            const SizedBox(height: 20),


          ],),
      ) ,
    );
  }




}