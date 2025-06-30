// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goglePolyLinesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePolyLinesModel _$GooglePolyLinesModelFromJson(
  Map<String, dynamic> json,
) => GooglePolyLinesModel(
  geocodedWaypoints:
      (json['geocoded_waypoints'] as List<dynamic>?)
          ?.map((e) => GeocodedWaypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
  routes:
      (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as String?,
);

Map<String, dynamic> _$GooglePolyLinesModelToJson(
  GooglePolyLinesModel instance,
) => <String, dynamic>{
  'geocoded_waypoints': instance.geocodedWaypoints,
  'routes': instance.routes,
  'status': instance.status,
};

GeocodedWaypoint _$GeocodedWaypointFromJson(Map<String, dynamic> json) =>
    GeocodedWaypoint(
      geocoderStatus: json['geocoder_status'] as String?,
      placeId: json['place_id'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GeocodedWaypointToJson(GeocodedWaypoint instance) =>
    <String, dynamic>{
      'geocoder_status': instance.geocoderStatus,
      'place_id': instance.placeId,
      'types': instance.types,
    };

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
  bounds:
      json['bounds'] == null
          ? null
          : Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
  copyrights: json['copyrights'] as String?,
  legs:
      (json['legs'] as List<dynamic>?)
          ?.map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
  overviewPolyline:
      json['overview_polyline'] == null
          ? null
          : Polylines.fromJson(
            json['overview_polyline'] as Map<String, dynamic>,
          ),
  summary: json['summary'] as String?,
  warnings: json['warnings'] as List<dynamic>?,
  waypointOrder: json['waypoint_order'] as List<dynamic>?,
);

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
  'bounds': instance.bounds,
  'copyrights': instance.copyrights,
  'legs': instance.legs,
  'overview_polyline': instance.overviewPolyline,
  'summary': instance.summary,
  'warnings': instance.warnings,
  'waypoint_order': instance.waypointOrder,
};

Bounds _$BoundsFromJson(Map<String, dynamic> json) => Bounds(
  northeast:
      json['northeast'] == null
          ? null
          : Northeast.fromJson(json['northeast'] as Map<String, dynamic>),
  southwest:
      json['southwest'] == null
          ? null
          : Northeast.fromJson(json['southwest'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BoundsToJson(Bounds instance) => <String, dynamic>{
  'northeast': instance.northeast,
  'southwest': instance.southwest,
};

Northeast _$NortheastFromJson(Map<String, dynamic> json) => Northeast(
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$NortheastToJson(Northeast instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
};

Leg _$LegFromJson(Map<String, dynamic> json) => Leg(
  distance:
      json['distance'] == null
          ? null
          : Distance.fromJson(json['distance'] as Map<String, dynamic>),
  duration:
      json['duration'] == null
          ? null
          : Distance.fromJson(json['duration'] as Map<String, dynamic>),
  endAddress: json['end_address'] as String?,
  endLocation:
      json['end_location'] == null
          ? null
          : Northeast.fromJson(json['end_location'] as Map<String, dynamic>),
  startAddress: json['start_address'] as String?,
  startLocation:
      json['start_location'] == null
          ? null
          : Northeast.fromJson(json['start_location'] as Map<String, dynamic>),
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
  trafficSpeedEntry: json['traffic_speed_entry'] as List<dynamic>?,
  viaWaypoint: json['via_waypoint'] as List<dynamic>?,
);

Map<String, dynamic> _$LegToJson(Leg instance) => <String, dynamic>{
  'distance': instance.distance,
  'duration': instance.duration,
  'end_address': instance.endAddress,
  'end_location': instance.endLocation,
  'start_address': instance.startAddress,
  'start_location': instance.startLocation,
  'steps': instance.steps,
  'traffic_speed_entry': instance.trafficSpeedEntry,
  'via_waypoint': instance.viaWaypoint,
};

Distance _$DistanceFromJson(Map<String, dynamic> json) => Distance(
  text: json['text'] as String?,
  value: (json['value'] as num?)?.toInt(),
);

Map<String, dynamic> _$DistanceToJson(Distance instance) => <String, dynamic>{
  'text': instance.text,
  'value': instance.value,
};

Step _$StepFromJson(Map<String, dynamic> json) => Step(
  distance:
      json['distance'] == null
          ? null
          : Distance.fromJson(json['distance'] as Map<String, dynamic>),
  duration:
      json['duration'] == null
          ? null
          : Distance.fromJson(json['duration'] as Map<String, dynamic>),
  endLocation:
      json['end_location'] == null
          ? null
          : Northeast.fromJson(json['end_location'] as Map<String, dynamic>),
  htmlInstructions: json['html_instructions'] as String?,
  polyline:
      json['polyline'] == null
          ? null
          : Polylines.fromJson(json['polyline'] as Map<String, dynamic>),
  startLocation:
      json['start_location'] == null
          ? null
          : Northeast.fromJson(json['start_location'] as Map<String, dynamic>),
  travelMode: json['travel_mode'] as String?,
  maneuver: json['maneuver'] as String?,
);

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
  'distance': instance.distance,
  'duration': instance.duration,
  'end_location': instance.endLocation,
  'html_instructions': instance.htmlInstructions,
  'polyline': instance.polyline,
  'start_location': instance.startLocation,
  'travel_mode': instance.travelMode,
  'maneuver': instance.maneuver,
};

Polylines _$PolylinesFromJson(Map<String, dynamic> json) =>
    Polylines(points: json['points'] as String?);

Map<String, dynamic> _$PolylinesToJson(Polylines instance) => <String, dynamic>{
  'points': instance.points,
};
