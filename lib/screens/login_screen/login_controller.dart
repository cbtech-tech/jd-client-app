import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/screens/login_screen/otpResponseModel.dart';
import 'package:just_delivery/screens/login_screen/verifyOtpResponseModel.dart';
import 'package:just_delivery/screens/otp_screen/otpScreen.dart';

import '../../api/api_service.dart';
import '../../constants/api_constants.dart';
import '../../customWidgets/customLoader.dart';
import '../../customWidgets/snackbar.dart';
import '../../routes/app_routes.dart';
import '../../utils/pref_utils.dart';
import '../onboarding_screens/onboardingBinding.dart' show OnboardingBinding;
import '../onboarding_screens/onboarding_screens.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var phoneController = TextEditingController();
  late TabController tabController;

  var firstScreen = true.obs;
  TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  RxString otpString = "".obs;

  final ApiService apiService = Get.find();

  var newUser = false.obs;
  RxInt secondsRemaining = 30.obs;
  Timer? _timer;
  RxBool showResendOtp = false.obs;
  // RxInt currentTabIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
    tabBarInit();
  }

  tabBarInit() {
    tabController = TabController(length: 2, vsync: this);

    // tabController.addListener(() {
    //   if (!tabController.indexIsChanging) {
    //     currentTabIndex.value = tabController.index;
    //   }
    // });
  }

  Future<void> loginFun(bool resendOtp) async {
    if (phoneController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Phone can't be empty");
      return;
    }

    LoaderUtil.showLoader();
    final body = {"mobileNumber": "+91${phoneController.text.toString()}"};

    final response = await apiService.postRequest(ApiConstants().login, body);

    if (response.isSuccess) {
      var loginModel = OtpResponseModel.fromJson(response.data);

      if (loginModel.success ?? false) {
        SnackbarUtil.showSuccessBottom("OTP send Successfully");
        startTimer();
        LoaderUtil.hideLoader();

        if (!resendOtp) {
          Get.to(() => OtpScreen());
        }
      } else {
        LoaderUtil.hideLoader();

        SnackbarUtil.showErrorTop(response.error ?? 'Something went wrong');
      }
    } else {
      LoaderUtil.hideLoader();

      SnackbarUtil.showErrorTop(response.error ?? 'Something went wrong');
    }
  }

  //   verifyOtp() async {
  //   if (pinController.text.isEmpty) {
  //     SnackbarUtil.showErrorTop("Otp can't be empty");
  //     return;
  //   }

  //   LoaderUtil.showLoader();

  //   final body = {
  //     "mobileNumber": "+91${phoneController.text}",
  //     "otp": pinController.text,
  //   };

  //   final response = await apiService.postRequest(
  //     ApiConstants().verifyOtp,
  //     body,
  //   );

  //   log("UserLoginData==>>>>${response.data}");

  //   var loginModel = VerifyOtpResponse.fromJson(response.data);

  //   LoaderUtil.hideLoader();

  //   if (response.isSuccess) {
  //     if (loginModel.success) {
  //       PrefUtils().setToken(loginModel.token ?? "");
  //       PrefUtils().setIsLoggedIn(true);

  //       final user = loginModel.user;

  //       Future.delayed(Duration(milliseconds: 100), () {
  //         SnackbarUtil.showSuccessBottom("OTP verified Successfully");

  //         if (loginModel.newUser == true ||
  //             user?.onboardingStatus == "not_started") {

  //               log("Go to onboarding============>>>>>");
  //           // Go to onboarding screen
  //           Get.to(OnboardingScreens(), binding: OnboardingBinding());
  //         } else if (user?.onboardingStatus == "completed") {
  //           if (user?.role == "user") {
  //             Get.offAllNamed(AppRoutes.dashboard);
  //           } else if (user?.role == "hq") {
  //             Get.offAllNamed(AppRoutes.historyDetails); // Change this route as needed
  //           } else {
  //             SnackbarUtil.showErrorTop("Unknown user role");
  //           }
  //         } else {
  //           SnackbarUtil.showErrorTop("Invalid onboarding status");
  //         }
  //       });
  //     } else {
  //       Future.delayed(Duration(milliseconds: 100), () {
  //         SnackbarUtil.showErrorTop(loginModel.message ?? "Login failed");
  //       });
  //     }
  //   } else {
  //     Future.delayed(Duration(milliseconds: 100), () {
  //       SnackbarUtil.showErrorTop(loginModel.message ?? "Request failed");
  //     });
  //   }
  // }

  verifyOtp() async {
    if (pinController.text.isEmpty) {
      SnackbarUtil.showErrorTop("Otp can't be empty");
      return;
    }

    LoaderUtil.showLoader();

    final body = {
      "mobileNumber": "+91${phoneController.text}",
      "otp": pinController.text,
    };

    final response = await apiService.postRequest(
      ApiConstants().verifyOtp,
      body,
    );
    var loginModel = VerifyOtpResponse.fromJson(response.data);

    log("UserLoginData==>>>>${response.data}");

    if (response.isSuccess) {
      if (loginModel.success) {
     
        PrefUtils().setToken(loginModel.token ?? "");
        PrefUtils().setIsLoggedIn(true);
        PrefUtils().setUsertype(loginModel.user!.role ?? "");

        LoaderUtil.hideLoader();

        // Delay for smooth transition before showing snackbar
        Future.delayed(Duration(milliseconds: 100), () {
          SnackbarUtil.showSuccessBottom("OTP verified Successfully");

          // Get.offAllNamed(AppRoutes.dashboard);

          if (loginModel.user?.onboardingStatus?.contains("not_started") ??
              false) {
                 Get.offAllNamed(AppRoutes.dashboard);
            // Get.to(OnboardingScreens(), binding: OnboardingBinding());
          } else {
            Get.offAllNamed(AppRoutes.dashboard);
          }
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

  void startTimer({int from = 30}) {
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
