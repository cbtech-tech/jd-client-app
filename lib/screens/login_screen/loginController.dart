import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/screens/login_screen/otpResponseModel.dart';
import 'package:just_delivery/screens/login_screen/verifyOtpResponseModel.dart';
import 'package:just_delivery/screens/onboarding_screens/onboarding_screens.dart';
import 'package:just_delivery/screens/otp_screen/otpScreen.dart';

import '../../api/api_service.dart';
import '../../constants/api_constants.dart';
import '../../customWidgets/customLoader.dart';
import '../../customWidgets/snackbar.dart';
import '../../routes/app_routes.dart';
import '../../utils/pref_utils.dart';
import '../onboarding_screens/onboardingBinding.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin {
  var phoneController = TextEditingController();
  late TabController tabController;


  var firstScreen = true.obs;
  TextEditingController pinController = TextEditingController() ;
  final FocusNode focusNode  = FocusNode();

  RxString otpString = "".obs;

  final ApiService apiService = Get.find();

  var newUser = false.obs;
  RxInt secondsRemaining = 60.obs;
  Timer? _timer;
  RxBool showResendOtp = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabBarInit();
  }
  tabBarInit(){

    tabController = TabController(length: 2, vsync: this );

  }

  Future<void> loginFun(bool resendOtp) async {

    if(phoneController.text.isEmpty){

      SnackbarUtil.showErrorTop("Phone can't be empty");
      return;
    }

    LoaderUtil.showLoader();
    final body = {
      "mobileNumber": "+91${phoneController.text.toString()}",
    };

    final response = await apiService.postRequest(ApiConstants().login, body);

    if (response.isSuccess) {

      var loginModel = OtpResponseModel.fromJson(response.data);

      if(loginModel.success??false)
      {
        SnackbarUtil.showSuccessBottom("OTP send Successfully");
        startTimer();
        LoaderUtil.hideLoader();

      if(!resendOtp)
        {
          Get.to(()=>OtpScreen());
        }



      }
      else {

        LoaderUtil.hideLoader();

        SnackbarUtil.showErrorTop(response.error ?? 'Something went wrong');
      }


    }
    else {

      LoaderUtil.hideLoader();

      SnackbarUtil.showErrorTop(response.error ?? 'Something went wrong');
    }






  }

  verifyOtp() async {
    if (pinController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Otp can't be empty");
      return;
    }

    LoaderUtil.showLoader();

    final body = {
      "mobileNumber": "+91${phoneController.text}",
      "otp": pinController.text
    };

    final response = await apiService.postRequest(ApiConstants().verifyOtp, body);
    var loginModel = VerifyOtpResponse.fromJson(response.data);

    if (response.isSuccess) {
      if (loginModel.success) {
        PrefUtils().setToken(loginModel.token ?? "");
        PrefUtils().setIsLoggedIn(true);

        LoaderUtil.hideLoader();

        // Delay for smooth transition before showing snackbar
        Future.delayed(Duration(milliseconds: 100), () {
          SnackbarUtil.showSuccessBottom("OTP verified Successfully");

          Get.offAllNamed(AppRoutes.dashboard);

          /*
          if (loginModel.user?.onboardingStatus?.contains("not_started") ?? false) {
            Get.to(OnboardingScreens(), binding: OnboardingBinding());
          }
          else{
            Get.offAllNamed(AppRoutes.dashboard);
          }*/
          

        });
      } else {
        LoaderUtil.hideLoader();

        // Wait before showing snackbar
        Future.delayed(Duration(milliseconds: 100), () {
          SnackbarUtil.showErrorTop(loginModel.message);
        });
      }
    } else {
      LoaderUtil.hideLoader();

      // Wait before showing snackbar
      Future.delayed(Duration(milliseconds: 100), () {
        SnackbarUtil.showErrorTop(loginModel.message);
      });
    }
  }

  void startTimer({int from = 60}) {
    secondsRemaining.value = from;
    showResendOtp.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value == 0) {
        timer.cancel();
        showResendOtp.value = true; // 👈 Set to true when countdown ends
      } else {
        secondsRemaining.value--;
      }
    });
  }

  void resetTimer() {
    startTimer(from: 60);
  }
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}