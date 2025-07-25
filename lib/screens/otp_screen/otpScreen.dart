import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../customWidgets/customButtom.dart';
import '../../customWidgets/textStyle.dart';
import '../../theme/theme_helper.dart';
import '../login_screen/login_controller.dart';

class OtpScreen extends GetView<LoginController> {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = ThemeHelper().appColor;
    final fillColor = Colors.white;
    final borderColor = ThemeHelper().appColor;

    final defaultPinTheme = PinTheme(
      width: 54,
      height: 51,
      textStyle: TextStyle(fontSize: 22, color: ThemeHelper().appColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(Icons.arrow_back),
                      ),

                      const SizedBox(height: 10),
                      Text("enter_otp".tr, style: CustomTextStyle.heading()),

                      const SizedBox(height: 10),
                      Text(
                        "We sent a code to ${controller.phoneController.text}",
                        style: CustomTextStyle.body(
                          color: PrimaryColors().gray80005,
                        ),
                      ),

                      const SizedBox(height: 40),
                      Center(
                        child: Pinput(
                          controller: controller.pinController,
                          focusNode: controller.focusNode,
                          defaultPinTheme: defaultPinTheme,
                          length: 6,
                          separatorBuilder: (index) => const SizedBox(width: 8),
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) => controller.verifyOtp(),
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
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      Obx(
                        () => Visibility(
                          visible: !controller.showResendOtp.value,
                          child: Center(
                            child: Text(
                              "Resend OTP in ${controller.secondsRemaining.value} seconds",
                              style: CustomTextStyle.subHeading(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      Obx(
                        () => Visibility(
                          visible: controller.showResendOtp.value,
                          child: Center(
                            child: InkWell(
                              onTap: () => controller.loginFun(true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: PrimaryColors().gray100,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.message_outlined,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Resend OTP via SMS",
                                      style: CustomTextStyle.body(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          text: "continue".tr,
                          onTap: () async => await controller.verifyOtp(),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
