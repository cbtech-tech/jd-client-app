import 'package:get/get.dart';
import 'package:just_delivery/screens/login_screen/loginBinding.dart';
import 'package:just_delivery/screens/login_screen/loginScreen.dart';

import '../screens/splash_screen/splashController.dart';
import '../screens/splash_screen/splashScreen.dart';

class AppRoutes {
  static const String welcomeScreen = '/welcome_screen';

  static const String loginScreen = '/login_screen';

  static const String otpScreen = '/otp_screen';
  static const String dashboard = '/dashboard';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),

    ),


   GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
/*
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(name: otpScreen, page: () => OtpScreen()),

  */
  ];
}
