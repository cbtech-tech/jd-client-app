import 'package:get/get.dart';
import 'package:just_delivery/screens/history_details_screen/history_details_binding.dart';
import 'package:just_delivery/screens/history_details_screen/history_details_screen.dart';
import 'package:just_delivery/screens/login_screen/loginBinding.dart';
import 'package:just_delivery/screens/login_screen/login_screen.dart';

import '../screens/dashboard_screen/bottomBindings.dart';
import '../screens/dashboard_screen/homeBottomScreen.dart';
import '../screens/splash_screen/splashScreen.dart';

class AppRoutes {
  static const String welcomeScreen = '/welcome_screen';

  static const String loginScreen = '/login_screen';

  static const String otpScreen = '/otp_screen';
  static const String dashboard = '/dashboard';
  static const String historyDetails = '/historyDetails';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(name: initialRoute, page: () => SplashScreen()),

    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: dashboard,
      page: () => HomeBottomScreen(),
      binding: BottomBindings(),
    ),

    GetPage(
      name: historyDetails,
      page: () => HistoryDetailsScreen(),
      binding: HistoryDetailsBinding(),
    ),


    // GetPage(name: name, page: page)

    /*
    GetPage(name: otpScreen, page: () => OtpScreen()),

  */
  ];
}
