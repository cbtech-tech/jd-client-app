import 'package:get/get.dart';

class HistoryController extends GetxController{

  RxInt selectedIndex = 0.obs;

  final List<String> options = ['all'.tr, 'completed'.tr, 'cancelled'.tr];
  final RxInt rating = 0.obs;
  final bool isEditable = true;
  var selectedDate = Rxn<DateTime>();

  void onRatingInfoTap() {} // toggle to false to make it read-only


  void onDateSelected(DateTime date) {
    selectedDate.value = date;
  }

}
