import 'dart:developer';
import 'package:get/get.dart';
import 'package:just_delivery/api/api_service.dart';
import '../../constants/api_constants.dart';

// class HQController extends GetxController {
//   final ApiService apiService = Get.find();

//   var deliveryList = [].obs; // List<dynamic>

//   @override
//   void onInit() {
//     super.onInit();
//     fetchHqData(); // Call API when controller initializes
//   }

//   Future<void> fetchHqData() async {
//     try {
//       final response = await apiService.getRequest(ApiConstants().hqLiveVahical);

//       if (response.isSuccess) {
//         log("ResponseData===>>>${response.data}");

//         // Direct assign without model
//         deliveryList.value = response.data['data']; // ✅ RIGHT
//       } else {
//         print("No data");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

// }



class HQController extends GetxController {
  final ApiService apiService = Get.find();

  var deliveryList = [].obs;
  late String startPoint; // 👈 Yeh value previous screen se aayegi

  @override
  void onInit() {
    super.onInit();

    // 👇 Argument receive from previous screen
    startPoint = Get.arguments ?? ""; // default "" if null

    if (startPoint.isNotEmpty) {
      fetchHqData(startPoint);
    } else {
      print("❌ startPoint not found in arguments");
    }
  }

  Future<void> fetchHqData(String location) async {
    try {
      final encodedLocation = Uri.encodeComponent(location); // space handle
      final url = "${ApiConstants().hqLiveVahical}?location=$encodedLocation";

      final response = await apiService.getRequest(url);

      if (response.isSuccess) {
        log("ResponseData===>>>${response.data}");

        // ✅ Assign API data directly to observable list
        deliveryList.value = response.data['data'] ?? [];
      } else {
        print("❌ No data");
      }
    } catch (e) {
      print("❌ Error: $e");
    }
  }
}
