import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/homeBottomScreen.dart';

import '../../constants/image_constants.dart';
import '../../customWidgets/customButtom.dart';
import '../../customWidgets/textStyle.dart';
import '../../theme/theme_helper.dart';
import '../dashboard_screen/bottomBindings.dart';
import '../dashboard_screen/home_screen/homeBinding.dart';
import '../onboarding_screens/onboardingBinding.dart';
import '../onboarding_screens/onboarding_screens.dart';
import 'loginController.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: mediaQuery.height * 0.03),

                        SizedBox(
                          width: 200,
                          child: Text("enter_phone".tr, style: CustomTextStyle.heading()),
                        ),

                        SizedBox(height: mediaQuery.height * 0.01),

                        Text(
                          "sign_in_to_access_your_account".tr,
                          style: CustomTextStyle.body(color: PrimaryColors().gray80005),
                        ),



                        controller.firstScreen.value
                            ? Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 45,
                          decoration: BoxDecoration(
                            color: PrimaryColors().gray60003,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: TabBar(
                            controller: controller.tabController,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.transparent,
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            labelColor: Colors.black,
                            tabs: const [
                              Tab(child: Center(child: Text("Log In"))),
                              Tab(child: Center(child: Text("Sign Up"))),
                            ],
                          ),
                        )
                            : const SizedBox(),

                        // FIX: Replace Expanded with SizedBox with fixed height
                        SizedBox(
                          height: Get.height*0.66,
                          child: TabBarView(
                            controller: controller.tabController,
                            children: [
                              _signInFormBuild(context, mediaQuery),
                              _signInFormBuild(context, mediaQuery),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }

  Widget _signInFormBuild(BuildContext context, Size mediaQuery) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: mediaQuery.height * 0.02),

          Text(
            "phone_number".tr,
            style: CustomTextStyle.body(color: PrimaryColors().darkGrey),
          ),

          const SizedBox(height: 15),

          TextField(
            controller: controller.phoneController,
            decoration: InputDecoration(
              labelText: '+91',
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

          const SizedBox(height: 30),

          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
            child: CustomButton(
              text: "sign_in".tr,
              onTap:()=>  controller.loginFun(false)  //Get.to(HomeBottomScreen(),binding: BottomBindings(),)    //controller.loginFun(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(1.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: "By registering or signing in you accept the "),
                  TextSpan(
                    text: "Terms and Conditions",
                    style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: Handle Terms and Conditions tap
                        print("Terms and Conditions tapped");
                        // e.g., Get.to(() => TermsScreen());
                      },
                  ),
                  const TextSpan(text: " and confirm that you’ve read and acknowledged the "),
                  TextSpan(
                    text: "privacy policy",
                    style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: Handle Privacy Policy tap
                        print("Privacy Policy tapped");
                        // e.g., Get.to(() => PrivacyPolicyScreen());
                      },
                  ),
                  const TextSpan(text: " of Just deliveries"),
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
