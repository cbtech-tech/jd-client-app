import 'package:get/get.dart';

class MenuListController extends GetxController{


  RxInt selectedIndex = 0.obs;

  final List<String> options = ['all'.tr, 'completed'.tr, 'cancelled'.tr];
  final RxInt rating = 0.obs;
  final bool isEditable = true;

}