
import 'package:get/get.dart';
import 'package:just_delivery/utils/pref_utils.dart';
import '../api/api_service.dart';
import '../customWidgets/customLoader.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
 //   Get.lazyPut<SplashController>(() => SplashController());
    Get.put(()=>LoaderController());
    Get.put(ApiService());

   // Connectivity connectivity = Connectivity();
  //  Get.put(NetworkInfo(connectivity));
  }
}
