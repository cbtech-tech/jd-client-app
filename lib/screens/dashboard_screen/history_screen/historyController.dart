import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/snackbar.dart';
import 'package:just_delivery/screens/dashboard_screen/history_screen/historyDataModel.dart';
import '../../../api/api_service.dart';
import '../../../constants/api_constants.dart';
import '../../../customWidgets/customLoader.dart';
import '../../../routes/app_routes.dart';

class HistoryController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<String> options = ['all'.tr, 'completed'.tr, 'cancelled'.tr];

  final RxInt rating = 0.obs;
  RxBool isEditable = true.obs;
  var selectedDate = Rxn<DateTime>();

  final ApiService apiService = Get.find();

  HistoryDataModel? historyDataModel;

  RxList<Datum> historyList = <Datum>[].obs;
  RxList<Datum> originalList = <Datum>[].obs;

  final selectedFeedback = <String>{}.obs;

  final List<String> feedback = [
    "Temperature Issue",
    "Timing/Delay",
    "Pilferage",
    "Driver behaviour",
    "Vehicle hygiene",
    "Material damage",
    "Vehicle did not report",
    "Vehicle change without intimation",
    "Delivery manager behaviour",
  ];

  void toggleSelection(String item) {
    if (selectedFeedback.contains(item)) {
      selectedFeedback.remove(item);
    } else {
      selectedFeedback.add(item);
    }
  }

  void onDateSelected(DateTime date) {
    selectedDate.value = date;
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAllHistory();
    });
  }

  /// Fetch history from API
  Future<void> fetchAllHistory() async {
    LoaderUtil.showLoader();

    try {
      final response = await apiService.getRequest(ApiConstants().userHistory);
      LoaderUtil.hideLoader();

      if (response.isSuccess) {
        historyDataModel = HistoryDataModel.fromJson(response.data);

        if (historyDataModel?.status ?? false) {
          originalList.assignAll(historyDataModel?.data ?? []);
          historyList.assignAll(originalList);
          print("==>> originalList fetched: ${originalList.length}");

          SnackbarUtil.showSuccessTop("History fetched successfully");
        } else {
          historyList.clear();
        }
      } else {
        historyList.clear();
        print("==>> API Error: historyList cleared");
      }
    } catch (e) {
      historyList.clear();
      LoaderUtil.hideLoader();
      print("HistoryController error: ${e.toString()}");
    }
  }

  /// Filter based on selected option
  void filterList(String option) {
    final keyword = option.toLowerCase();
    print("==> Selected Filter: $keyword");
    switch (keyword) {
      case 'all':
        historyList.assignAll(originalList);
        break;
      case 'completed':
        historyList.assignAll(
          originalList.where((model) {
            final status = model.assignedVehicle?.deliveryStatus?.toLowerCase() ?? '';
            return status == 'completed' || status == 'delivered';
          }).toList(),
        );
        break;

      case 'cancelled':
        historyList.assignAll(
          originalList.where((model) {
            final status = model.assignedVehicle?.deliveryStatus?.toLowerCase() ?? '';
            return status == 'cancelled';
          }).toList(),
        );
        break;

      default:
        historyList.assignAll(originalList);
        break;
    }

    print("==> Filtered list count: ${historyList.length}");
  }

  /// Navigate to history details screen
  void moveToHistory(Datum model) {
    Get.toNamed(AppRoutes.historyDetails, arguments: {
      "args": model,
    });
  }

  /// Submit feedback to API
  Future<void> setFeedbackToApi(Datum model) async {
    final payload = {
      "userHistoryId": model.id.toString(),
      "rating": rating.value,
      "ratingComment": selectedFeedback.toList(),
    };

    final response = await apiService.postRequest(ApiConstants().feedback, payload);

    if (response.isSuccess) {
      SnackbarUtil.showSuccessTop("Feedback submitted successfully");
      isEditable.value = false;
    }
  }
}
