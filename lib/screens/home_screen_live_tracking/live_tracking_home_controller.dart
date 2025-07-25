import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_delivery/constants/image_constants.dart';

import 'package:just_delivery/theme/theme_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/api_service.dart';
import '../../../constants/api_constants.dart';
import '../../utils/pref_utils.dart';
import 'liveTracking/liveTrackingDataModel.dart';

class LiveTrackingHomeController extends GetxController {
  RxString storeName = "".obs;
  RxString deliveryStatus = "Pickup On-time".obs;
  final apiKey = "AIzaSyDqnDn4E0YCF3zaJuS9ez58XOcHhBtNVkc";

  final ApiService apiService = Get.find();
  LiveTrackingModel? liveTrackingModel;
  RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? mapController;
  Timer? _liveDataTimer;
  final RxSet<Polyline> polyLines = <Polyline>{}.obs;

  RxBool isLoading = true.obs;

  late AnimatedContainer rotationController;

  var driverName = "".obs;
  var managerNumber = "".obs;
  var vehicleNumber = "".obs;
  var temp = "".obs;
  var totalDistance = "".obs;
  var orderId = "".obs;
  var pdfUrl = "".obs;
  late BitmapDescriptor vehicleIcon;
  late BitmapDescriptor startPointIcon;
  late BitmapDescriptor checkPointsIcon;
  late String id;

  @override
  Future<void> onInit() async {
    super.onInit();
    _loadCustomMarker();

    final args = Get.arguments as Map<String, dynamic>?;
    id = args?['id'] ?? '';

    startLiveDataFetching();
  }

  void _loadCustomMarker() async {
    try {
      vehicleIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(48, 48)), // Adjust size if needed
        ImageConstants.truckMapIcon,
      );
      startPointIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(48, 48)), // Adjust size if needed
        ImageConstants.startPointMarker,
      );
      checkPointsIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(48, 48)), // Adjust size if needed
        ImageConstants.storesMarker,
      );
    } catch (e) {
      print("==>>>e.toString() ${e.toString()}");
    }
  }

  void startLiveDataFetching() {
    fetchLiveData();
    _liveDataTimer = Timer.periodic(
      Duration(seconds: 60),
      (_) => fetchLiveData(),
    );
  }

  void stopLiveDataFetching() {
    _liveDataTimer?.cancel();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> fetchLiveData() async {
    try {
      isLoading.value = true;
      final userType = PrefUtils().getUsertype() ?? "user";

      String url;
      if (userType == "hq") {
        url = "${ApiConstants().liveTrackingApi}/$id";
      } else {
        url = ApiConstants().liveTrackingApi;
      }

      log("url========>>>$url");
      final response = await apiService.getRequest(url);

      log("ResponseLiveData=>>>>${response.data}");
      if (response.isSuccess) {
        liveTrackingModel = LiveTrackingModel.fromJson(response.data);

        managerNumber.value =
            liveTrackingModel?.assignedVehicle?.managerNumber.toString() ?? "";
        driverName.value =
            liveTrackingModel?.assignedVehicle?.managerName ?? "";
        vehicleNumber.value = liveTrackingModel?.data?.vehicleno ?? "";
        temp.value = liveTrackingModel?.data?.temperature1.toString() ?? "";
        orderId.value = liveTrackingModel?.data?.vehicleid.toString() ?? "";
        storeName.value =
            liveTrackingModel?.assignedVehicle?.companyName?.companyName
                .toString() ??
            "";
        pdfUrl.value =
            liveTrackingModel?.assignedVehicle?.consignmentLink.toString() ??
            "";
        final position = LatLng(
          liveTrackingModel?.data?.lat ?? 22.303,
          liveTrackingModel?.data?.lng ?? 77.2090,
        );

        await plotRouteWithMarkers(position);
      } else {
        print(" No live data found");
      }
    } catch (e) {
      print(" Error fetching live data: $e");
    }
  }

  Future<List<LatLng>> getRoutePoints({
    required LatLng origin,
    required LatLng destination,
    required List<LatLng> waypoints,
  }) async {
    try {
      final waypointParams = waypoints
          .map((point) => "${point.latitude},${point.longitude}")
          .join("|");

      final url =
          "https://maps.googleapis.com/maps/api/directions/json"
          "?origin=${origin.latitude},${origin.longitude}"
          "&destination=${destination.latitude},${destination.longitude}"
          "${waypoints.isNotEmpty ? "&waypoints=$waypointParams" : ""}"
          "&key=$apiKey";

      final response = await GetConnect().get(url);

      print("==>>> google url ==>>> $url");

      if (response.statusCode == 200) {
        final data = response.body;

        if (data['routes'] == null || data['routes'].isEmpty) {
          throw Exception("No routes found in response");
        }

        final encoded = data['routes'][0]['overview_polyline']?['points'];

        if (encoded == null || encoded.isEmpty) {
          throw Exception("No polyline points found");
        }

        final polylinePoints = PolylinePoints().decodePolyline(encoded);
        return polylinePoints
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList();
      } else {
        throw Exception("Failed to fetch directions: ${response.statusCode}");
      }
    } catch (e) {
      print(" Error in getRoutePoints: $e");
      return []; // fallback to empty list
    }
  }

  Future<void> makePhoneCall() async {
    final callingNumber = "+91${managerNumber.value}";

    final Uri _url = Uri(scheme: 'tel', path: callingNumber);
    try {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      print("❌ Error launching URL: $e");
    }
  }

  Future<void> plotRouteWithMarkers(LatLng vehiclePosition) async {
    final assignedVehicle = liveTrackingModel?.assignedVehicle;
    if (assignedVehicle == null) return;

    final startPoint = LatLng(
      assignedVehicle.startPoint?.lati ?? 0.0,
      assignedVehicle.startPoint?.longi ?? 0.0,
    );

    final endPoint = LatLng(
      assignedVehicle.endPoint?.lati ?? 0.0,
      assignedVehicle.endPoint?.longi ?? 0.0,
    );

    print(
      "==>>>startPoint.toString()  ${startPoint.toString()}  endPoint ${endPoint.toString()} ==>>",
    );

    final List<LatLng> waypoints =
        assignedVehicle.checkPoint
            ?.map((cp) => LatLng(cp.lati ?? 0.0, cp.longi ?? 0.0))
            .toList() ??
        [];

    for (int i = 0; i < assignedVehicle.checkPoint!.length; i++) {
      print(
        "Waypoint===???? ${i + 1}: Lat = ${assignedVehicle.checkPoint![i].lati}, Lng = ${assignedVehicle.checkPoint![i].longi}",
      );
    }

    List<LatLng> routePoints = await getRoutePoints(
      origin: startPoint,
      destination: endPoint,
      waypoints: waypoints,
    );

    Set<Marker> routeMarkers = {};
    final color = Color(0xFF177938);
    final hsv = HSVColor.fromColor(color);
    routeMarkers.add(
      Marker(
        markerId: MarkerId("start"),
        position: startPoint,
        icon: startPointIcon,
        infoWindow: InfoWindow(title: "Start Point"),
      ),
    );

    for (int i = 0; i < waypoints.length; i++) {
      final cp = assignedVehicle.checkPoint?[i];
      routeMarkers.add(
        Marker(
          markerId: MarkerId("cp_$i"),
          position: waypoints[i],
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueYellow,
          ),
          infoWindow: InfoWindow(title: cp?.name ?? "Checkpoint ${i + 1}"),
        ),
      );
    }

    routeMarkers.add(
      Marker(
        markerId: MarkerId("end"),
        position: endPoint,
        icon: checkPointsIcon,
        infoWindow: InfoWindow(title: "End Point"),
      ),
    );

    routeMarkers.add(
      Marker(
        markerId: MarkerId("vehicle"),
        position: vehiclePosition,
        icon: vehicleIcon,
        infoWindow: InfoWindow(title: "Vehicle Location"),
      ),
    );

    markers.value = routeMarkers;

    polyLines.value = {
      Polyline(
        polylineId: PolylineId("route"),
        points: routePoints,
        color: ThemeHelper().appColor,
        width: 2,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
      ),
    };

    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(vehiclePosition, 14),
    );
  }
}
