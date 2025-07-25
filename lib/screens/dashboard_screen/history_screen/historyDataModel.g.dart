// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historyDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDataModel _$HistoryDataModelFromJson(Map<String, dynamic> json) =>
    HistoryDataModel(
      status: json['status'] as bool?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$HistoryDataModelToJson(HistoryDataModel instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['_id'] as String?,
  userId:
      json['userId'] == null
          ? null
          : UserId.fromJson(json['userId'] as Map<String, dynamic>),
  assignedVehicle:
      json['assignedVehicle'] == null
          ? null
          : AssignedVehicle.fromJson(
            json['assignedVehicle'] as Map<String, dynamic>,
          ),
  liveDataArr:
      (json['liveDataArr'] as List<dynamic>?)
          ?.map((e) => LiveDataArr.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  v: (json['__v'] as num?)?.toInt(),
  reportLink: json['reportLink'] as String?,
  feedback: json['feedback'] as bool?,
  feedbacks:
      (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => Feedback.fromJson(e as Map<String, dynamic>))
          .toList(),
  checkpoints:
      (json['checkpoints'] as List<dynamic>?)
          ?.map((e) => CheckpointsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  '_id': instance.id,
  'userId': instance.userId,
  'assignedVehicle': instance.assignedVehicle,
  'liveDataArr': instance.liveDataArr,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'checkpoints': instance.checkpoints,
  '__v': instance.v,
  'reportLink': instance.reportLink,
  'feedback': instance.feedback,
  'feedbacks': instance.feedbacks,
};

AssignedVehicle _$AssignedVehicleFromJson(Map<String, dynamic> json) =>
    AssignedVehicle(
      startPoint:
          json['startPoint'] == null
              ? null
              : Point.fromJson(json['startPoint'] as Map<String, dynamic>),
      endPoint:
          json['endPoint'] == null
              ? null
              : Point.fromJson(json['endPoint'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      checkPoint:
          (json['checkPoint'] as List<dynamic>?)
              ?.map((e) => CheckPoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      deliveryStatus: json['deliveryStatus'] as String?,
      deliveryCompleted: json['deliveryCompleted'] as bool?,
      vehicleInStore: json['vehicleInStore'] as bool?,
      timerStartTime: json['timerStartTime'] as String?,
      radius: (json['radius'] as num?)?.toDouble(),
      delayStatus: json['delayStatus'] as bool?,
      delayTime: (json['delayTime'] as num?)?.toInt(),
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
      consignmentLink: json['consignmentLink'] as String?,
      storeName: json['storeName'] as String?,
    );

Map<String, dynamic> _$AssignedVehicleToJson(AssignedVehicle instance) =>
    <String, dynamic>{
      'startPoint': instance.startPoint,
      'endPoint': instance.endPoint,
      '_id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'vehicleNumber': instance.vehicleNumber,
      'checkPoint': instance.checkPoint,
      'deliveryStatus': instance.deliveryStatus,
      'deliveryCompleted': instance.deliveryCompleted,
      'vehicleInStore': instance.vehicleInStore,
      'timerStartTime': instance.timerStartTime,
      'radius': instance.radius,
      'delayStatus': instance.delayStatus,
      'delayTime': instance.delayTime,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'consignmentLink': instance.consignmentLink,
      'storeName': instance.storeName,
    };

CheckPoint _$CheckPointFromJson(Map<String, dynamic> json) => CheckPoint(
  lati: (json['lati'] as num?)?.toDouble(),
  longi: (json['longi'] as num?)?.toDouble(),
  name: json['name'] as String?,
  completed: json['completed'] as bool?,
  id: json['_id'] as String?,
);

Map<String, dynamic> _$CheckPointToJson(CheckPoint instance) =>
    <String, dynamic>{
      'lati': instance.lati,
      'longi': instance.longi,
      'name': instance.name,
      'completed': instance.completed,
      '_id': instance.id,
    };

Point _$PointFromJson(Map<String, dynamic> json) => Point(
  lati: (json['lati'] as num?)?.toDouble(),
  longi: (json['longi'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
  'lati': instance.lati,
  'longi': instance.longi,
};

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => Feedback(
  id: json['_id'] as String?,
  userHistoryId: json['userHistoryId'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  ratingComment:
      (json['ratingComment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  v: (json['__v'] as num?)?.toInt(),
);

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
  '_id': instance.id,
  'userHistoryId': instance.userHistoryId,
  'rating': instance.rating,
  'ratingComment': instance.ratingComment,
  'createdAt': instance.createdAt?.toIso8601String(),
  '__v': instance.v,
};

LiveDataArr _$LiveDataArrFromJson(Map<String, dynamic> json) => LiveDataArr(
  vehicleno: json['vehicleno'] as String?,
  vehicleid: (json['vehicleid'] as num?)?.toInt(),
  kind: json['kind'] as String?,
  unitno: json['unitno'] as String?,
  groupname: json['groupname'] as String?,
  vehiclestatus: json['vehiclestatus'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  location: json['location'] as String?,
  lastupdated: json['lastupdated'] as String?,
  vehiclespeed: (json['vehiclespeed'] as num?)?.toInt(),
  odometer: (json['odometer'] as num?)?.toInt(),
  distance: (json['distance'] as num?)?.toDouble(),
  digitalstatus: json['digitalstatus'] as String?,
  temperature1: json['temperature1'] as String?,
  temperature2: json['temperature2'] as String?,
  temperature3: json['temperature3'] as String?,
  temperature4: json['temperature4'] as String?,
  drivername: json['drivername'] as String?,
  ignition: (json['ignition'] as num?)?.toInt(),
  timestamp:
      json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
  utctimestamp:
      json['utctimestamp'] == null
          ? null
          : DateTime.parse(json['utctimestamp'] as String),
  systemtime:
      json['systemtime'] == null
          ? null
          : DateTime.parse(json['systemtime'] as String),
  utcsystemtime:
      json['utcsystemtime'] == null
          ? null
          : DateTime.parse(json['utcsystemtime'] as String),
  vehiclestatusNew: json['vehiclestatus_new'] as String?,
  doorSensor1: json['doorSensor1'] as String?,
  doorSensor2: json['doorSensor2'] as String?,
  idleSince: (json['idleSince'] as num?)?.toInt(),
  direction: (json['direction'] as num?)?.toInt(),
  deviceId: (json['deviceId'] as num?)?.toInt(),
  locationName: json['locationName'] as String?,
  type: json['type'] as String?,
  vehicleMotionStatus: json['vehicleMotionStatus'] as String?,
  deviceTrackingState: json['deviceTrackingState'] as String?,
  shorturl: json['shorturl'] as String?,
);

Map<String, dynamic> _$LiveDataArrToJson(LiveDataArr instance) =>
    <String, dynamic>{
      'vehicleno': instance.vehicleno,
      'vehicleid': instance.vehicleid,
      'kind': instance.kind,
      'unitno': instance.unitno,
      'groupname': instance.groupname,
      'vehiclestatus': instance.vehiclestatus,
      'lat': instance.lat,
      'lng': instance.lng,
      'location': instance.location,
      'lastupdated': instance.lastupdated,
      'vehiclespeed': instance.vehiclespeed,
      'odometer': instance.odometer,
      'distance': instance.distance,
      'digitalstatus': instance.digitalstatus,
      'temperature1': instance.temperature1,
      'temperature2': instance.temperature2,
      'temperature3': instance.temperature3,
      'temperature4': instance.temperature4,
      'drivername': instance.drivername,
      'ignition': instance.ignition,
      'timestamp': instance.timestamp?.toIso8601String(),
      'utctimestamp': instance.utctimestamp?.toIso8601String(),
      'systemtime': instance.systemtime?.toIso8601String(),
      'utcsystemtime': instance.utcsystemtime?.toIso8601String(),
      'vehiclestatus_new': instance.vehiclestatusNew,
      'doorSensor1': instance.doorSensor1,
      'doorSensor2': instance.doorSensor2,
      'idleSince': instance.idleSince,
      'direction': instance.direction,
      'deviceId': instance.deviceId,
      'locationName': instance.locationName,
      'type': instance.type,
      'vehicleMotionStatus': instance.vehicleMotionStatus,
      'deviceTrackingState': instance.deviceTrackingState,
      'shorturl': instance.shorturl,
    };

CheckpointsModel _$CheckpointsModelFromJson(Map<String, dynamic> json) =>
    CheckpointsModel(
      checkpointName: json['checkpointName'] as String?,
      checkpointLat: (json['checkpointLat'] as num?)?.toDouble(),
      checkpointLng: (json['checkpointLng'] as num?)?.toDouble(),
      inTime:
          json['inTime'] == null
              ? null
              : DateTime.parse(json['inTime'] as String),
      inTemp: json['inTemp'] as String?,
      id: json['_id'] as String?,
      outTemp: json['outTemp'] as String?,
      outTime:
          json['outTime'] == null
              ? null
              : DateTime.parse(json['outTime'] as String),
      timeSpent: (json['timeSpent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckpointsModelToJson(CheckpointsModel instance) =>
    <String, dynamic>{
      'checkpointName': instance.checkpointName,
      'checkpointLat': instance.checkpointLat,
      'checkpointLng': instance.checkpointLng,
      'inTime': instance.inTime?.toIso8601String(),
      'inTemp': instance.inTemp,
      '_id': instance.id,
      'outTemp': instance.outTemp,
      'outTime': instance.outTime?.toIso8601String(),
      'timeSpent': instance.timeSpent,
    };

UserId _$UserIdFromJson(Map<String, dynamic> json) => UserId(
  id: json['_id'] as String?,
  mobileNumber: json['mobileNumber'] as String?,
  role: json['role'] as String?,
  isActive: json['isActive'] as bool?,
  onboardingStatus: json['onboardingStatus'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  v: (json['__v'] as num?)?.toInt(),
  lastLogin:
      json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
);

Map<String, dynamic> _$UserIdToJson(UserId instance) => <String, dynamic>{
  '_id': instance.id,
  'mobileNumber': instance.mobileNumber,
  'role': instance.role,
  'isActive': instance.isActive,
  'onboardingStatus': instance.onboardingStatus,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  '__v': instance.v,
  'lastLogin': instance.lastLogin?.toIso8601String(),
};
