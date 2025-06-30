import 'package:json_annotation/json_annotation.dart';

part 'liveTrackingDataModel.g.dart';


@JsonSerializable()
class LiveTrackingModel {
  LiveTrackingModel({
    required this.status,
    required this.message,
    required this.data,
    required this.assignedVehicle,
  });

  final bool? status;
  static const String statusKey = "status";

  final String? message;
  static const String messageKey = "message";

  final Data? data;
  static const String dataKey = "data";

  final AssignedVehicle? assignedVehicle;
  static const String assignedVehicleKey = "assignedVehicle";


  LiveTrackingModel copyWith({
    bool? status,
    String? message,
    Data? data,
    AssignedVehicle? assignedVehicle,
  }) {
    return LiveTrackingModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      assignedVehicle: assignedVehicle ?? this.assignedVehicle,
    );
  }

  factory LiveTrackingModel.fromJson(Map<String, dynamic> json) => _$LiveTrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveTrackingModelToJson(this);

  @override
  String toString(){
    return "$status, $message, $data, $assignedVehicle, ";
  }
}

@JsonSerializable()
class AssignedVehicle {
  AssignedVehicle({
    required this.startPoint,
    required this.endPoint,
    required this.timerStartTime,
    required this.id,
    required this.phoneNumber,
    required this.vehicleNumber,
    required this.checkPoint,
    required this.deliveryStatus,
    required this.radius,
    required this.delayStatus,
    required this.delayTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.deliveryCompleted,
    required this.vehicleInStore,
  });

  final Point? startPoint;
  static const String startPointKey = "startPoint";

  final Point? endPoint;
  static const String endPointKey = "endPoint";

  final dynamic timerStartTime;
  static const String timerStartTimeKey = "timerStartTime";


  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final String? phoneNumber;
  static const String phoneNumberKey = "phoneNumber";

  final String? vehicleNumber;
  static const String vehicleNumberKey = "vehicleNumber";

  final List<CheckPoint>? checkPoint;
  static const String checkPointKey = "checkPoint";

  final String? deliveryStatus;
  static const String deliveryStatusKey = "deliveryStatus";

  final int? radius;
  static const String radiusKey = "radius";

  final bool? delayStatus;
  static const String delayStatusKey = "delayStatus";

  final int? delayTime;
  static const String delayTimeKey = "delayTime";

  final DateTime? createdAt;
  static const String createdAtKey = "createdAt";

  final DateTime? updatedAt;
  static const String updatedAtKey = "updatedAt";


  @JsonKey(name: '__v')
  final int? v;
  static const String vKey = "__v";

  final bool? deliveryCompleted;
  static const String deliveryCompletedKey = "deliveryCompleted";

  final bool? vehicleInStore;
  static const String vehicleInStoreKey = "vehicleInStore";


  AssignedVehicle copyWith({
    Point? startPoint,
    Point? endPoint,
    dynamic? timerStartTime,
    String? id,
    String? phoneNumber,
    String? vehicleNumber,
    List<CheckPoint>? checkPoint,
    String? deliveryStatus,
    int? radius,
    bool? delayStatus,
    int? delayTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    bool? deliveryCompleted,
    bool? vehicleInStore,
  }) {
    return AssignedVehicle(
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      timerStartTime: timerStartTime ?? this.timerStartTime,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      checkPoint: checkPoint ?? this.checkPoint,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      radius: radius ?? this.radius,
      delayStatus: delayStatus ?? this.delayStatus,
      delayTime: delayTime ?? this.delayTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      deliveryCompleted: deliveryCompleted ?? this.deliveryCompleted,
      vehicleInStore: vehicleInStore ?? this.vehicleInStore,
    );
  }

  factory AssignedVehicle.fromJson(Map<String, dynamic> json) => _$AssignedVehicleFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedVehicleToJson(this);

  @override
  String toString(){
    return "$startPoint, $endPoint, $timerStartTime, $id, $phoneNumber, $vehicleNumber, $checkPoint, $deliveryStatus, $radius, $delayStatus, $delayTime, $createdAt, $updatedAt, $v, $deliveryCompleted, $vehicleInStore, ";
  }
}

@JsonSerializable()
class CheckPoint {
  CheckPoint({
    required this.completed,
    required this.lati,
    required this.longi,
    required this.name,
    required this.id,
  });

  final bool? completed;
  static const String completedKey = "completed";

  final double? lati;
  static const String latiKey = "lati";

  final double? longi;
  static const String longiKey = "longi";

  final String? name;
  static const String nameKey = "name";


  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";


  CheckPoint copyWith({
    bool? completed,
    double? lati,
    double? longi,
    String? name,
    String? id,
  }) {
    return CheckPoint(
      completed: completed ?? this.completed,
      lati: lati ?? this.lati,
      longi: longi ?? this.longi,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  factory CheckPoint.fromJson(Map<String, dynamic> json) => _$CheckPointFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPointToJson(this);

  @override
  String toString(){
    return "$completed, $lati, $longi, $name, $id, ";
  }
}

@JsonSerializable()
class Point {
  Point({
    required this.lati,
    required this.longi,
  });

  final double? lati;
  static const String latiKey = "lati";

  final double? longi;
  static const String longiKey = "longi";


  Point copyWith({
    double? lati,
    double? longi,
  }) {
    return Point(
      lati: lati ?? this.lati,
      longi: longi ?? this.longi,
    );
  }

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);

  @override
  String toString(){
    return "$lati, $longi, ";
  }
}

@JsonSerializable()
class Data {
  Data({
    required this.vehicleno,
    required this.vehicleid,
    required this.kind,
    required this.unitno,
    required this.groupname,
    required this.vehiclestatus,
    required this.lat,
    required this.lng,
    required this.location,
    required this.lastupdated,
    required this.vehiclespeed,
    required this.odometer,
    required this.distance,
    required this.digitalstatus,
    required this.temperature1,
    required this.temperature2,
    required this.temperature3,
    required this.temperature4,
    required this.drivername,
    required this.ignition,
    required this.timestamp,
    required this.utctimestamp,
    required this.systemtime,
    required this.utcsystemtime,
    required this.vehiclestatusNew,
    required this.doorSensor1,
    required this.doorSensor2,
    required this.idleSince,
    required this.direction,
    required this.deviceId,
    required this.locationName,
    required this.type,
    required this.vehicleMotionStatus,
    required this.deviceTrackingState,
    required this.shorturl,
  });

  final String? vehicleno;
  static const String vehiclenoKey = "vehicleno";

  final int? vehicleid;
  static const String vehicleidKey = "vehicleid";

  final String? kind;
  static const String kindKey = "kind";

  final String? unitno;
  static const String unitnoKey = "unitno";

  final String? groupname;
  static const String groupnameKey = "groupname";

  final String? vehiclestatus;
  static const String vehiclestatusKey = "vehiclestatus";

  final double? lat;
  static const String latKey = "lat";

  final double? lng;
  static const String lngKey = "lng";

  final String? location;
  static const String locationKey = "location";

  final String? lastupdated;
  static const String lastupdatedKey = "lastupdated";

  final int? vehiclespeed;
  static const String vehiclespeedKey = "vehiclespeed";

  final int? odometer;
  static const String odometerKey = "odometer";

  final int? distance;
  static const String distanceKey = "distance";

  final String? digitalstatus;
  static const String digitalstatusKey = "digitalstatus";

  final String? temperature1;
  static const String temperature1Key = "temperature1";

  final String? temperature2;
  static const String temperature2Key = "temperature2";

  final String? temperature3;
  static const String temperature3Key = "temperature3";

  final String? temperature4;
  static const String temperature4Key = "temperature4";

  final String? drivername;
  static const String drivernameKey = "drivername";

  final int? ignition;
  static const String ignitionKey = "ignition";

  final DateTime? timestamp;
  static const String timestampKey = "timestamp";

  final DateTime? utctimestamp;
  static const String utctimestampKey = "utctimestamp";

  final DateTime? systemtime;
  static const String systemtimeKey = "systemtime";

  final DateTime? utcsystemtime;
  static const String utcsystemtimeKey = "utcsystemtime";


  @JsonKey(name: 'vehiclestatus_new')
  final String? vehiclestatusNew;
  static const String vehiclestatusNewKey = "vehiclestatus_new";

  final String? doorSensor1;
  static const String doorSensor1Key = "doorSensor1";

  final String? doorSensor2;
  static const String doorSensor2Key = "doorSensor2";

  final int? idleSince;
  static const String idleSinceKey = "idleSince";

  final int? direction;
  static const String directionKey = "direction";

  final int? deviceId;
  static const String deviceIdKey = "deviceId";

  final String? locationName;
  static const String locationNameKey = "locationName";

  final String? type;
  static const String typeKey = "type";

  final String? vehicleMotionStatus;
  static const String vehicleMotionStatusKey = "vehicleMotionStatus";

  final String? deviceTrackingState;
  static const String deviceTrackingStateKey = "deviceTrackingState";

  final String? shorturl;
  static const String shorturlKey = "shorturl";


  Data copyWith({
    String? vehicleno,
    int? vehicleid,
    String? kind,
    String? unitno,
    String? groupname,
    String? vehiclestatus,
    double? lat,
    double? lng,
    String? location,
    String? lastupdated,
    int? vehiclespeed,
    int? odometer,
    int? distance,
    String? digitalstatus,
    String? temperature1,
    String? temperature2,
    String? temperature3,
    String? temperature4,
    String? drivername,
    int? ignition,
    DateTime? timestamp,
    DateTime? utctimestamp,
    DateTime? systemtime,
    DateTime? utcsystemtime,
    String? vehiclestatusNew,
    String? doorSensor1,
    String? doorSensor2,
    int? idleSince,
    int? direction,
    int? deviceId,
    String? locationName,
    String? type,
    String? vehicleMotionStatus,
    String? deviceTrackingState,
    String? shorturl,
  }) {
    return Data(
      vehicleno: vehicleno ?? this.vehicleno,
      vehicleid: vehicleid ?? this.vehicleid,
      kind: kind ?? this.kind,
      unitno: unitno ?? this.unitno,
      groupname: groupname ?? this.groupname,
      vehiclestatus: vehiclestatus ?? this.vehiclestatus,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      location: location ?? this.location,
      lastupdated: lastupdated ?? this.lastupdated,
      vehiclespeed: vehiclespeed ?? this.vehiclespeed,
      odometer: odometer ?? this.odometer,
      distance: distance ?? this.distance,
      digitalstatus: digitalstatus ?? this.digitalstatus,
      temperature1: temperature1 ?? this.temperature1,
      temperature2: temperature2 ?? this.temperature2,
      temperature3: temperature3 ?? this.temperature3,
      temperature4: temperature4 ?? this.temperature4,
      drivername: drivername ?? this.drivername,
      ignition: ignition ?? this.ignition,
      timestamp: timestamp ?? this.timestamp,
      utctimestamp: utctimestamp ?? this.utctimestamp,
      systemtime: systemtime ?? this.systemtime,
      utcsystemtime: utcsystemtime ?? this.utcsystemtime,
      vehiclestatusNew: vehiclestatusNew ?? this.vehiclestatusNew,
      doorSensor1: doorSensor1 ?? this.doorSensor1,
      doorSensor2: doorSensor2 ?? this.doorSensor2,
      idleSince: idleSince ?? this.idleSince,
      direction: direction ?? this.direction,
      deviceId: deviceId ?? this.deviceId,
      locationName: locationName ?? this.locationName,
      type: type ?? this.type,
      vehicleMotionStatus: vehicleMotionStatus ?? this.vehicleMotionStatus,
      deviceTrackingState: deviceTrackingState ?? this.deviceTrackingState,
      shorturl: shorturl ?? this.shorturl,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString(){
    return "$vehicleno, $vehicleid, $kind, $unitno, $groupname, $vehiclestatus, $lat, $lng, $location, $lastupdated, $vehiclespeed, $odometer, $distance, $digitalstatus, $temperature1, $temperature2, $temperature3, $temperature4, $drivername, $ignition, $timestamp, $utctimestamp, $systemtime, $utcsystemtime, $vehiclestatusNew, $doorSensor1, $doorSensor2, $idleSince, $direction, $deviceId, $locationName, $type, $vehicleMotionStatus, $deviceTrackingState, $shorturl, ";
  }
}
