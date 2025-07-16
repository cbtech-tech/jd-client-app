import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/pref_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> checkUserExist() async {

    await Future.delayed(Duration(seconds: 3));

    if(PrefUtils().getIsLoggedIn()&&(PrefUtils().getToken()!=null))
      {
        Get.offAllNamed(AppRoutes.dashboard);

      }
    else {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Run after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserExist();
    });

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.6,
            padding: const EdgeInsets.all(20),
            child: Image.asset("assets/images/splash_screen.png", fit: BoxFit.fitWidth),
          ),
          const SizedBox(height: 20),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(20),
            child: Image.asset("assets/images/appLogo.png", fit: BoxFit.fitWidth),
          ),
        ],
      ),
    );
  }
}
