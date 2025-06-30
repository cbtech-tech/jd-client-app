import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_delivery/constants/image_constants.dart';
import 'package:just_delivery/screens/dashboard_screen/home_screen/liveTracking/goglePolyLinesModel.dart';
import 'package:just_delivery/theme/theme_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/api_service.dart';
import '../../../constants/api_constants.dart';
import 'liveTracking/liveTrackingDataModel.dart';

class HomeController extends GetxController {
  RxString storeName = "Blue Tokai".obs;
  RxString deliveryStatus = "Pickup On-time".obs;

  final ApiService apiService = Get.find();
  LiveTrackingModel? liveTrackingModel;
  RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? mapController;
  Timer? _liveDataTimer;
  final RxSet<Polyline> polyLines = <Polyline>{}.obs;

  var driverName = "".obs;
  var vehicleNumber = "".obs;
  var temp = "".obs;
  var totalDistance = "".obs;
  var orderId = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    startLiveDataFetching();
  }

  void startLiveDataFetching() {
    fetchLiveData();
    _liveDataTimer = Timer.periodic(Duration(minutes: 1), (_) => fetchLiveData());
  }

  void stopLiveDataFetching() {
    _liveDataTimer?.cancel();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> fetchLiveData() async {
    try {
      final response = await apiService.getRequest(ApiConstants().liveTrackingApi);
      if (response.isSuccess) {
        liveTrackingModel = LiveTrackingModel.fromJson(response.data);

        driverName.value = liveTrackingModel?.data?.drivername ?? "";
        vehicleNumber.value = liveTrackingModel?.data?.vehicleno ?? "";
        temp.value = liveTrackingModel?.data?.temperature1.toString() ?? "";
        orderId.value = liveTrackingModel?.data?.vehicleid.toString() ?? "";

        final position = LatLng(
          liveTrackingModel?.data?.lat ?? 22.303,
          liveTrackingModel?.data?.lng ?? 77.2090,
        );

        await plotRouteWithMarkers(position);


      } else {
        print("❌ No live data found");
      }
    } catch (e) {
      print("❌ Error fetching live data: $e");
    }
  }

  Future<List<LatLng>> getRoutePoints({
    required LatLng origin,
    required LatLng destination,
    required List<LatLng> waypoints,
  }) async {
    final apiKey = "AIzaSyDqnDn4E0YCF3zaJuS9ez58XOcHhBtNVkc";

    final waypointParams = waypoints
        .map((point) => "${point.latitude},${point.longitude}")
        .join("|");

    final url = "https://maps.googleapis.com/maps/api/directions/json"
        "?origin=${origin.latitude},${origin.longitude}"
        "&destination=${destination.latitude},${destination.longitude}"
        "&waypoints=$waypointParams"
        "&key=$apiKey";

    final response = await GetConnect().get(url);
    if (response.statusCode == 200) {
      final googlePolyLinesModel = GooglePolyLinesModel.fromJson(response.body);
      final encoded = googlePolyLinesModel.routes?[0].overviewPolyline?.points;

      if (encoded == null || encoded.isEmpty) {
        throw Exception("No polyline points found");
      }

      final polylinePoints = PolylinePoints().decodePolyline(encoded);
      return polylinePoints.map((e) => LatLng(e.latitude, e.longitude)).toList();
    } else {
      throw Exception("Failed to fetch directions");
    }
  }

  Future<void> makePhoneCall() async {
    final Uri _url = Uri(scheme: 'tel', path: '+918840064187');
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

    final List<LatLng> waypoints = assignedVehicle.checkPoint
        ?.map((cp) => LatLng(cp.lati ?? 0.0, cp.longi ?? 0.0))
        .toList() ??
        [];

    List<LatLng> routePoints = await getRoutePoints(
      origin: startPoint,
      destination: endPoint,
      waypoints: waypoints,
    );

    Set<Marker> routeMarkers = {};

    routeMarkers.add(
      Marker(
        markerId: MarkerId("start"),
        position: startPoint,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: "Start Point"),
      ),
    );

    for (int i = 0; i < waypoints.length; i++) {
      final cp = assignedVehicle.checkPoint?[i];
      routeMarkers.add(
        Marker(
          markerId: MarkerId("cp_$i"),
          position: waypoints[i],
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          infoWindow: InfoWindow(title: cp?.name ?? "Checkpoint ${i + 1}"),
        ),
      );
    }

    routeMarkers.add(
      Marker(
        markerId: MarkerId("end"),
        position: endPoint,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: "End Point"),
      ),
    );

    routeMarkers.add(
      Marker(
        markerId: MarkerId("vehicle"),
        position: vehiclePosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: "Vehicle Location"),
      ),
    );

    markers.value = routeMarkers;

    polyLines.value = {
      Polyline(
        polylineId: PolylineId("route"),
        points: routePoints,
        color: Colors.blue,
        width: 5,
      )
    };

    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(startPoint, 14),
    );
  }
}
