import 'package:json_annotation/json_annotation.dart';

part 'historyDataModel.g.dart';

@JsonSerializable()
class HistoryDataModel {
  HistoryDataModel({
    required this.status,
    required this.data,
  });

  final bool? status;
  static const String statusKey = "status";

  final List<Datum>? data;
  static const String dataKey = "data";


  HistoryDataModel copyWith({
    bool? status,
    List<Datum>? data,
  }) {
    return HistoryDataModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory HistoryDataModel.fromJson(Map<String, dynamic> json) => _$HistoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDataModelToJson(this);

  @override
  String toString(){
    return "$status, $data, ";
  }
}

@JsonSerializable()
class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.assignedVehicle,
    required this.liveDataArr,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.reportLink,
    required this.feedback,
    required this.feedbacks,
  });

  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final UserId? userId;
  static const String userIdKey = "userId";

  final AssignedVehicle? assignedVehicle;
  static const String assignedVehicleKey = "assignedVehicle";

  final List<LiveDataArr>? liveDataArr;
  static const String liveDataArrKey = "liveDataArr";

  final DateTime? createdAt;
  static const String createdAtKey = "createdAt";

  final DateTime? updatedAt;
  static const String updatedAtKey = "updatedAt";


  @JsonKey(name: '__v')
  final int? v;
  static const String vKey = "__v";

  final String? reportLink;
  static const String reportLinkKey = "reportLink";

  final bool? feedback;
  static const String feedbackKey = "feedback";

  final List<Feedback>? feedbacks;
  static const String feedbacksKey = "feedbacks";


  Datum copyWith({
    String? id,
    UserId? userId,
    AssignedVehicle? assignedVehicle,
    List<LiveDataArr>? liveDataArr,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? reportLink,
    bool? feedback,
    List<Feedback>? feedbacks,
  }) {
    return Datum(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      assignedVehicle: assignedVehicle ?? this.assignedVehicle,
      liveDataArr: liveDataArr ?? this.liveDataArr,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      reportLink: reportLink ?? this.reportLink,
      feedback: feedback ?? this.feedback,
      feedbacks: feedbacks ?? this.feedbacks,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  String toString(){
    return "$id, $userId, $assignedVehicle, $liveDataArr, $createdAt, $updatedAt, $v, $reportLink, $feedback, $feedbacks, ";
  }
}

@JsonSerializable()
class AssignedVehicle {
  AssignedVehicle({
    required this.startPoint,
    required this.endPoint,
    required this.id,
    required this.phoneNumber,
    required this.vehicleNumber,
    required this.checkPoint,
    required this.deliveryStatus,
    required this.deliveryCompleted,
    required this.vehicleInStore,
    required this.timerStartTime,
    required this.radius,
    required this.delayStatus,
    required this.delayTime,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.consignmentLink,
    required this.storeName,
  });

  final Point? startPoint;
  static const String startPointKey = "startPoint";

  final Point? endPoint;
  static const String endPointKey = "endPoint";


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

  final bool? deliveryCompleted;
  static const String deliveryCompletedKey = "deliveryCompleted";

  final bool? vehicleInStore;
  static const String vehicleInStoreKey = "vehicleInStore";

  final String? timerStartTime;
  static const String timerStartTimeKey = "timerStartTime";

  final double? radius;
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

  final String? consignmentLink;
  static const String consignmentLinkKey = "consignmentLink";

  final String? storeName;
  static const String storeNameKey = "storeName";


  AssignedVehicle copyWith({
    Point? startPoint,
    Point? endPoint,
    String? id,
    String? phoneNumber,
    String? vehicleNumber,
    List<CheckPoint>? checkPoint,
    String? deliveryStatus,
    bool? deliveryCompleted,
    bool? vehicleInStore,
    String? timerStartTime,
    double? radius,
    bool? delayStatus,
    int? delayTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? consignmentLink,
    String? storeName,
  }) {
    return AssignedVehicle(
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      checkPoint: checkPoint ?? this.checkPoint,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      deliveryCompleted: deliveryCompleted ?? this.deliveryCompleted,
      vehicleInStore: vehicleInStore ?? this.vehicleInStore,
      timerStartTime: timerStartTime ?? this.timerStartTime,
      radius: radius ?? this.radius,
      delayStatus: delayStatus ?? this.delayStatus,
      delayTime: delayTime ?? this.delayTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      consignmentLink: consignmentLink ?? this.consignmentLink,
      storeName: storeName ?? this.storeName,
    );
  }

  factory AssignedVehicle.fromJson(Map<String, dynamic> json) => _$AssignedVehicleFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedVehicleToJson(this);

  @override
  String toString(){
    return "$startPoint, $endPoint, $id, $phoneNumber, $vehicleNumber, $checkPoint, $deliveryStatus, $deliveryCompleted, $vehicleInStore, $timerStartTime, $radius, $delayStatus, $delayTime, $createdAt, $updatedAt, $v, $consignmentLink, $storeName, ";
  }
}

@JsonSerializable()
class CheckPoint {
  CheckPoint({
    required this.lati,
    required this.longi,
    required this.name,
    required this.completed,
    required this.id,
  });

  final double? lati;
  static const String latiKey = "lati";

  final double? longi;
  static const String longiKey = "longi";

  final String? name;
  static const String nameKey = "name";

  final bool? completed;
  static const String completedKey = "completed";


  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";


  CheckPoint copyWith({
    double? lati,
    double? longi,
    String? name,
    bool? completed,
    String? id,
  }) {
    return CheckPoint(
      lati: lati ?? this.lati,
      longi: longi ?? this.longi,
      name: name ?? this.name,
      completed: completed ?? this.completed,
      id: id ?? this.id,
    );
  }

  factory CheckPoint.fromJson(Map<String, dynamic> json) => _$CheckPointFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPointToJson(this);

  @override
  String toString(){
    return "$lati, $longi, $name, $completed, $id, ";
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
class Feedback {
  Feedback({
    required this.id,
    required this.userHistoryId,
    required this.rating,
    required this.ratingComment,
    required this.createdAt,
    required this.v,
  });

  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final String? userHistoryId;
  static const String userHistoryIdKey = "userHistoryId";

  final int? rating;
  static const String ratingKey = "rating";

  final List<String>? ratingComment;
  static const String ratingCommentKey = "ratingComment";

  final DateTime? createdAt;
  static const String createdAtKey = "createdAt";


  @JsonKey(name: '__v')
  final int? v;
  static const String vKey = "__v";


  Feedback copyWith({
    String? id,
    String? userHistoryId,
    int? rating,
    List<String>? ratingComment,
    DateTime? createdAt,
    int? v,
  }) {
    return Feedback(
      id: id ?? this.id,
      userHistoryId: userHistoryId ?? this.userHistoryId,
      rating: rating ?? this.rating,
      ratingComment: ratingComment ?? this.ratingComment,
      createdAt: createdAt ?? this.createdAt,
      v: v ?? this.v,
    );
  }

  factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);

  @override
  String toString(){
    return "$id, $userHistoryId, $rating, $ratingComment, $createdAt, $v, ";
  }
}

@JsonSerializable()
class LiveDataArr {
  LiveDataArr({
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

  final double? distance;
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


  LiveDataArr copyWith({
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
    double? distance,
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
    return LiveDataArr(
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

  factory LiveDataArr.fromJson(Map<String, dynamic> json) => _$LiveDataArrFromJson(json);

  Map<String, dynamic> toJson() => _$LiveDataArrToJson(this);

  @override
  String toString(){
    return "$vehicleno, $vehicleid, $kind, $unitno, $groupname, $vehiclestatus, $lat, $lng, $location, $lastupdated, $vehiclespeed, $odometer, $distance, $digitalstatus, $temperature1, $temperature2, $temperature3, $temperature4, $drivername, $ignition, $timestamp, $utctimestamp, $systemtime, $utcsystemtime, $vehiclestatusNew, $doorSensor1, $doorSensor2, $idleSince, $direction, $deviceId, $locationName, $type, $vehicleMotionStatus, $deviceTrackingState, $shorturl, ";
  }
}

@JsonSerializable()
class UserId {
  UserId({
    required this.id,
    required this.mobileNumber,
    required this.role,
    required this.isActive,
    required this.onboardingStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastLogin,
  });

  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final String? mobileNumber;
  static const String mobileNumberKey = "mobileNumber";

  final String? role;
  static const String roleKey = "role";

  final bool? isActive;
  static const String isActiveKey = "isActive";

  final String? onboardingStatus;
  static const String onboardingStatusKey = "onboardingStatus";

  final DateTime? createdAt;
  static const String createdAtKey = "createdAt";

  final DateTime? updatedAt;
  static const String updatedAtKey = "updatedAt";


  @JsonKey(name: '__v')
  final int? v;
  static const String vKey = "__v";

  final DateTime? lastLogin;
  static const String lastLoginKey = "lastLogin";


  UserId copyWith({
    String? id,
    String? mobileNumber,
    String? role,
    bool? isActive,
    String? onboardingStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    DateTime? lastLogin,
  }) {
    return UserId(
      id: id ?? this.id,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      onboardingStatus: onboardingStatus ?? this.onboardingStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  factory UserId.fromJson(Map<String, dynamic> json) => _$UserIdFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdToJson(this);

  @override
  String toString(){
    return "$id, $mobileNumber, $role, $isActive, $onboardingStatus, $createdAt, $updatedAt, $v, $lastLogin, ";
  }
}
