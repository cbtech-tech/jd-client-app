import 'package:get/get.dart';
import 'package:just_delivery/screens/onboarding_screens/onboarding_controller.dart';

class OnboardingBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>OnboardingController());
  }


}