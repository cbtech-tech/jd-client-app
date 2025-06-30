import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

import '../../constants/image_constants.dart';
import '../../customWidgets/customButtom.dart';
import '../../customWidgets/textStyle.dart';
import '../../routes/app_routes.dart';
import '../../theme/theme_helper.dart';
import '../login_screen/loginController.dart';

class OtpScreen extends GetView<LoginController> {

  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final focusedBorderColor = ThemeHelper().appColor;
    final fillColor =Colors.white ;
    final borderColor =  ThemeHelper().appColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle:  TextStyle(
        fontSize: 22,
        color: ThemeHelper().appColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    // TODO: implement build
    return Scaffold(
      body: SafeArea(child:
      Padding(
          padding: const EdgeInsets.all(16.0),

          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              SizedBox(height: mediaQuery.height*0.01,),

              InkWell(
                  onTap: ()=> Get.back(),
                  child:Icon(Icons.arrow_back)),

              SizedBox(height: mediaQuery.height*0.01,),

              Text("enter_otp".tr,style: CustomTextStyle.heading(),),

              SizedBox(height: mediaQuery.height*0.01,),

              Text("We send code to ${controller.phoneController.text} ".tr,style: CustomTextStyle.body(color: PrimaryColors().gray80005),),


              SizedBox(height: mediaQuery.height*0.1,),




              Center (child:
              Pinput(
                // You can pass your own SmsRetriever implementation based on any package
                // in this example we are using the SmartAuth
                // smsRetriever: smsRetriever,
                controller:controller.pinController,
                focusNode:controller.focusNode,
                defaultPinTheme: defaultPinTheme,
                length: 6,
                separatorBuilder: (index) => const SizedBox(width: 8),

                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');

                  controller.verifyOtp();

                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
              ),

              SizedBox(height: mediaQuery.height*0.02,),

              SizedBox(height: mediaQuery.height*0.02,),


              Center(child: Text("resend".tr,style: CustomTextStyle.subHeading(fontSize: 14,color: Colors.grey),)),

              SizedBox(height: mediaQuery.height*0.02,),


              Center(
                child: Container(
                  height: 50,
                  width: Get.width*0.45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:  PrimaryColors().gray100
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    
                    Icon(Icons.phone_outlined,color: Colors.black,),
                    Text("Get OTP via Call", style: CustomTextStyle.body(fontSize: 14,color: Colors.black),)



                  ],),
                ),
              ),

              SizedBox(height: mediaQuery.height*0.02,),

              Center(
                child: Container(
                  height: 50,
                  width: Get.width*0.45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:  PrimaryColors().gray100
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Icon(Icons.message_outlined,color: Colors.black,),
                      Text("Resend OTP via SMS", style: CustomTextStyle.body(fontSize: 14,color: Colors.black),)



                    ],),
                ),
              ),

              Spacer(),

              Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child:  CustomButton(text: "continue".tr,onTap:() async {
                    await controller.verifyOtp();
                  },

                  )),



            ],)
      )
      ),
    );




  }

}