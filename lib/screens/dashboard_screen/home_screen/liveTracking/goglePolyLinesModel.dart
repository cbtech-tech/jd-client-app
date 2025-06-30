import 'package:json_annotation/json_annotation.dart';

part 'goglePolyLinesModel.g.dart';

@JsonSerializable()
class GooglePolyLinesModel {
  GooglePolyLinesModel({
    required this.geocodedWaypoints,
    required this.routes,
    required this.status,
  });

  @JsonKey(name: 'geocoded_waypoints')
  final List<GeocodedWaypoint>? geocodedWaypoints;
  static const String geocodedWaypointsKey = "geocoded_waypoints";

  final List<Route>? routes;
  static const String routesKey = "routes";

  final String? status;
  static const String statusKey = "status";


  GooglePolyLinesModel copyWith({
    List<GeocodedWaypoint>? geocodedWaypoints,
    List<Route>? routes,
    String? status,
  }) {
    return GooglePolyLinesModel(
      geocodedWaypoints: geocodedWaypoints ?? this.geocodedWaypoints,
      routes: routes ?? this.routes,
      status: status ?? this.status,
    );
  }

  factory GooglePolyLinesModel.fromJson(Map<String, dynamic> json) => _$GooglePolyLinesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GooglePolyLinesModelToJson(this);

  @override
  String toString(){
    return "$geocodedWaypoints, $routes, $status, ";
  }
}

@JsonSerializable()
class GeocodedWaypoint {
  GeocodedWaypoint({
    required this.geocoderStatus,
    required this.placeId,
    required this.types,
  });

  @JsonKey(name: 'geocoder_status')
  final String? geocoderStatus;
  static const String geocoderStatusKey = "geocoder_status";


  @JsonKey(name: 'place_id')
  final String? placeId;
  static const String placeIdKey = "place_id";

  final List<String>? types;
  static const String typesKey = "types";


  GeocodedWaypoint copyWith({
    String? geocoderStatus,
    String? placeId,
    List<String>? types,
  }) {
    return GeocodedWaypoint(
      geocoderStatus: geocoderStatus ?? this.geocoderStatus,
      placeId: placeId ?? this.placeId,
      types: types ?? this.types,
    );
  }

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) => _$GeocodedWaypointFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodedWaypointToJson(this);

  @override
  String toString(){
    return "$geocoderStatus, $placeId, $types, ";
  }
}

@JsonSerializable()
class Route {
  Route({
    required this.bounds,
    required this.copyrights,
    required this.legs,
    required this.overviewPolyline,
    required this.summary,
    required this.warnings,
    required this.waypointOrder,
  });

  final Bounds? bounds;
  static const String boundsKey = "bounds";

  final String? copyrights;
  static const String copyrightsKey = "copyrights";

  final List<Leg>? legs;
  static const String legsKey = "legs";


  @JsonKey(name: 'overview_polyline')
  final Polylines? overviewPolyline;
  static const String overviewPolylineKey = "overview_polyline";

  final String? summary;
  static const String summaryKey = "summary";

  final List<dynamic>? warnings;
  static const String warningsKey = "warnings";


  @JsonKey(name: 'waypoint_order')
  final List<dynamic>? waypointOrder;
  static const String waypointOrderKey = "waypoint_order";


  Route copyWith({
    Bounds? bounds,
    String? copyrights,
    List<Leg>? legs,
    Polylines? overviewPolyline,
    String? summary,
    List<dynamic>? warnings,
    List<dynamic>? waypointOrder,
  }) {
    return Route(
      bounds: bounds ?? this.bounds,
      copyrights: copyrights ?? this.copyrights,
      legs: legs ?? this.legs,
      overviewPolyline: overviewPolyline ?? this.overviewPolyline,
      summary: summary ?? this.summary,
      warnings: warnings ?? this.warnings,
      waypointOrder: waypointOrder ?? this.waypointOrder,
    );
  }

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);

  @override
  String toString(){
    return "$bounds, $copyrights, $legs, $overviewPolyline, $summary, $warnings, $waypointOrder, ";
  }
}

@JsonSerializable()
class Bounds {
  Bounds({
    required this.northeast,
    required this.southwest,
  });

  final Northeast? northeast;
  static const String northeastKey = "northeast";

  final Northeast? southwest;
  static const String southwestKey = "southwest";


  Bounds copyWith({
    Northeast? northeast,
    Northeast? southwest,
  }) {
    return Bounds(
      northeast: northeast ?? this.northeast,
      southwest: southwest ?? this.southwest,
    );
  }

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);

  Map<String, dynamic> toJson() => _$BoundsToJson(this);

  @override
  String toString(){
    return "$northeast, $southwest, ";
  }
}

@JsonSerializable()
class Northeast {
  Northeast({
    required this.lat,
    required this.lng,
  });

  final double? lat;
  static const String latKey = "lat";

  final double? lng;
  static const String lngKey = "lng";


  Northeast copyWith({
    double? lat,
    double? lng,
  }) {
    return Northeast(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  factory Northeast.fromJson(Map<String, dynamic> json) => _$NortheastFromJson(json);

  Map<String, dynamic> toJson() => _$NortheastToJson(this);

  @override
  String toString(){
    return "$lat, $lng, ";
  }
}

@JsonSerializable()
class Leg {
  Leg({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.steps,
    required this.trafficSpeedEntry,
    required this.viaWaypoint,
  });

  final Distance? distance;
  static const String distanceKey = "distance";

  final Distance? duration;
  static const String durationKey = "duration";


  @JsonKey(name: 'end_address')
  final String? endAddress;
  static const String endAddressKey = "end_address";


  @JsonKey(name: 'end_location')
  final Northeast? endLocation;
  static const String endLocationKey = "end_location";


  @JsonKey(name: 'start_address')
  final String? startAddress;
  static const String startAddressKey = "start_address";


  @JsonKey(name: 'start_location')
  final Northeast? startLocation;
  static const String startLocationKey = "start_location";

  final List<Step>? steps;
  static const String stepsKey = "steps";


  @JsonKey(name: 'traffic_speed_entry')
  final List<dynamic>? trafficSpeedEntry;
  static const String trafficSpeedEntryKey = "traffic_speed_entry";


  @JsonKey(name: 'via_waypoint')
  final List<dynamic>? viaWaypoint;
  static const String viaWaypointKey = "via_waypoint";


  Leg copyWith({
    Distance? distance,
    Distance? duration,
    String? endAddress,
    Northeast? endLocation,
    String? startAddress,
    Northeast? startLocation,
    List<Step>? steps,
    List<dynamic>? trafficSpeedEntry,
    List<dynamic>? viaWaypoint,
  }) {
    return Leg(
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      endAddress: endAddress ?? this.endAddress,
      endLocation: endLocation ?? this.endLocation,
      startAddress: startAddress ?? this.startAddress,
      startLocation: startLocation ?? this.startLocation,
      steps: steps ?? this.steps,
      trafficSpeedEntry: trafficSpeedEntry ?? this.trafficSpeedEntry,
      viaWaypoint: viaWaypoint ?? this.viaWaypoint,
    );
  }

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);

  Map<String, dynamic> toJson() => _$LegToJson(this);

  @override
  String toString(){
    return "$distance, $duration, $endAddress, $endLocation, $startAddress, $startLocation, $steps, $trafficSpeedEntry, $viaWaypoint, ";
  }
}

@JsonSerializable()
class Distance {
  Distance({
    required this.text,
    required this.value,
  });

  final String? text;
  static const String textKey = "text";

  final int? value;
  static const String valueKey = "value";


  Distance copyWith({
    String? text,
    int? value,
  }) {
    return Distance(
      text: text ?? this.text,
      value: value ?? this.value,
    );
  }

  factory Distance.fromJson(Map<String, dynamic> json) => _$DistanceFromJson(json);

  Map<String, dynamic> toJson() => _$DistanceToJson(this);

  @override
  String toString(){
    return "$text, $value, ";
  }
}

@JsonSerializable()
class Step {
  Step({
    required this.distance,
    required this.duration,
    required this.endLocation,
    required this.htmlInstructions,
    required this.polyline,
    required this.startLocation,
    required this.travelMode,
    required this.maneuver,
  });

  final Distance? distance;
  static const String distanceKey = "distance";

  final Distance? duration;
  static const String durationKey = "duration";


  @JsonKey(name: 'end_location')
  final Northeast? endLocation;
  static const String endLocationKey = "end_location";


  @JsonKey(name: 'html_instructions')
  final String? htmlInstructions;
  static const String htmlInstructionsKey = "html_instructions";

  final Polylines? polyline;
  static const String polylineKey = "polyline";


  @JsonKey(name: 'start_location')
  final Northeast? startLocation;
  static const String startLocationKey = "start_location";


  @JsonKey(name: 'travel_mode')
  final String? travelMode;
  static const String travelModeKey = "travel_mode";

  final String? maneuver;
  static const String maneuverKey = "maneuver";


  Step copyWith({
    Distance? distance,
    Distance? duration,
    Northeast? endLocation,
    String? htmlInstructions,
    Polylines? polyline,
    Northeast? startLocation,
    String? travelMode,
    String? maneuver,
  }) {
    return Step(
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      endLocation: endLocation ?? this.endLocation,
      htmlInstructions: htmlInstructions ?? this.htmlInstructions,
      polyline: polyline ?? this.polyline,
      startLocation: startLocation ?? this.startLocation,
      travelMode: travelMode ?? this.travelMode,
      maneuver: maneuver ?? this.maneuver,
    );
  }

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  Map<String, dynamic> toJson() => _$StepToJson(this);

  @override
  String toString(){
    return "$distance, $duration, $endLocation, $htmlInstructions, $polyline, $startLocation, $travelMode, $maneuver, ";
  }
}

@JsonSerializable()
class Polylines {
  Polylines({
    required this.points,
  });

  final String? points;
  static const String pointsKey = "points";


  Polylines copyWith({
    String? points,
  }) {
    return Polylines(
      points: points ?? this.points,
    );
  }

  factory Polylines.fromJson(Map<String, dynamic> json) => _$PolylinesFromJson(json);

  Map<String, dynamic> toJson() => _$PolylinesToJson(this);

  @override
  String toString(){
    return "$points, ";
  }
}
