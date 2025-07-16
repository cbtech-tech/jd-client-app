import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/routes/app_routes.dart';
import 'localization/app_localization.dart';
import 'theme/theme_helper.dart';
import 'utils/inital_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _deviceInfo();
  runApp(const MyApp());
}

Future<void> _deviceInfo() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final info = await deviceInfoPlugin.androidInfo;
  print("Device Model: ${info.model}");

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      color: Colors.white,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'app_name'.tr,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
      smartManagement: SmartManagement.full,
    );
  }
}
