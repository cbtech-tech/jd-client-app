import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_delivery/constants/api_constants.dart';
import 'package:just_delivery/customWidgets/customLoader.dart';

import '../../api/api_service.dart';
import '../../customWidgets/snackbar.dart';
import '../../utils/commonFuntions.dart';
import '../dashboard_screen/history_screen/historyDataModel.dart';

class HistoryDetailsController extends GetxController {
  Datum? model;

  var appBarName = "Order Details".obs;
  Rx<LatLng?> startPoint = Rx<LatLng?>(null);
  Rx<LatLng?> endPoint = Rx<LatLng?>(null);
  RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? mapController;
  RxSet<Polyline> polyLines = <Polyline>{}.obs;
  final RxInt rating = 0.obs;
   RxBool isEditable = true.obs;
  final ApiService apiService = Get.find();

  var startAddress = "".obs;
  var endAddress = "".obs;

  var distance = "".obs;

  var storeName = "".obs;
  final selectedFeedback = <String>{}.obs;

  void toggleSelection(String item) {
    if (selectedFeedback.contains(item)) {
      selectedFeedback.remove(item);
    } else {
      selectedFeedback.add(item);
    }
  }
  final List<String> feedback = [
    "Temperature Issue",
    "Timing/Delay",
    "Pilferage",
    "Driver behaviour",
    "Vehicle hygiene",
    "Material damage",
  "Vehicle did not report",
    "Vehicle change without intimation",
    "Delivery manager behaviour"
  ];



  @override
  void onInit() {
    super.onInit();



    final args = Get.arguments as Map<String, dynamic>;
    model = args['args'];

    final start = LatLng(
      model?.assignedVehicle?.startPoint?.lati ?? 0.0,
      model?.assignedVehicle?.startPoint?.longi ?? 0.0,
    );

    final end = LatLng(
      model?.assignedVehicle?.endPoint?.lati ?? 0.0,
      model?.assignedVehicle?.endPoint?.longi ?? 0.0,
    );

    startPoint.value = start;
    endPoint.value = end;

    markers.addAll([
      Marker(
        markerId: MarkerId("start"),
        position: start,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: "Start Point"),
      ),
      Marker(
        markerId: MarkerId("end"),
        position: end,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: "End Point"),
      ),
    ]);
    polyLines.add(
      Polyline(
        polylineId: PolylineId("route"),
        points: [start, end],
        color: const Color(0xFF3B82F6), // Blue
        width: 5,
      ),
    );

    getDistanceWithDio();
    getPlaceNameWithLatitude();
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
    setMapBounds(); // Focus on both markers

  }
  void setMapBounds() {
    if (startPoint == null || endPoint == null || mapController == null) return;

    if ((startPoint.value!.latitude == 0.0 && startPoint.value!.longitude == 0.0) ||
        (endPoint.value!.latitude == 0.0 && endPoint.value!.longitude == 0.0)) {
      print("❌ Invalid coordinates: (0.0, 0.0)");
      return;
    }


      if (startPoint.value == null || endPoint.value == null ||
          mapController == null) return;

      final LatLng start = startPoint.value!;
      final LatLng end = endPoint.value!;

      if ((start.latitude == 0.0 && start.longitude == 0.0) ||
          (end.latitude == 0.0 && end.longitude == 0.0)) {
        print("❌ Invalid coordinates: (0.0, 0.0)");
        return;
      }

      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          start.latitude < end.latitude ? start.latitude : end.latitude,
          start.longitude < end.longitude ? start.longitude : end.longitude,
        ),
        northeast: LatLng(
          start.latitude > end.latitude ? start.latitude : end.latitude,
          start.longitude > end.longitude ? start.longitude : end.longitude,
        ),
      );

      mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 70),
      );


      mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 70),
      );
    }

  Future<void> getDistanceWithDio() async {
  LoaderUtil.showLoader();
    var apiKey = ApiConstants().YOUR_API_KEY; // Replace with your real key

    final url = 'https://maps.googleapis.com/maps/api/distancematrix/json';

    try {
      final dio = Dio();
      final response = await dio.get(url, queryParameters: {
        'origins': startPoint.value,
        'destinations': endPoint.value,
        'key': apiKey,
      });

      if (response.statusCode == 200) {
        final data = response.data;
         distance.value = data['rows'][0]['elements'][0]['distance']['text'].toString();
        final duration = data['rows'][0]['elements'][0]['duration']['text'];
        LoaderUtil.hideLoader();
        print('Distance==>>: $distance');
        print('Duration: $duration');
      } else {
        LoaderUtil.hideLoader();
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      LoaderUtil.hideLoader();
      print('Error: $e');
    }
  }

  Future<void> getPlaceNameWithLatitude() async {

      final locationService = LocationService();
      startAddress.value = (await locationService.getAddressFromCoordinates(startPoint.value!.latitude, startPoint.value!.longitude))!;
      endAddress.value = (await locationService.getAddressFromCoordinates(endPoint.value!.latitude, endPoint.value!.longitude))!;


    storeName.value=  getLocationName(endPoint.value!.latitude, endPoint.value!.longitude).toString();

      print("==>>  startAddress.value  ${ startAddress.value }");

  }

  String? getLocationName(double lat, double lng) {
    try {
      return model!.assignedVehicle!.checkPoint!.firstWhere(
            (location) => location.lati == lat && location.longi == lng,
      ).name;
    } catch (e) {
      return null; // or return "Unknown"
    }
  }


  setFeedbackToApi() async {

    print("==>> selectedFeedback.toList() ${ selectedFeedback.toList()} ");
   final map =  {
      "userHistoryId": "${model?.id.toString()}",
    "rating": rating.value,
    "ratingComment":
      selectedFeedback.toList()

  };
    final response = await apiService.postRequest(ApiConstants().feedback,map);
   if (response.isSuccess){
     SnackbarUtil.showSuccessTop("Feedback submitted successfully");

     isEditable .value= false;

   }

  }


}
