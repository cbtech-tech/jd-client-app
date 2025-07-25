// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liveTrackingDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveTrackingModel _$LiveTrackingModelFromJson(Map<String, dynamic> json) =>
    LiveTrackingModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
      assignedVehicle:
          json['assignedVehicle'] == null
              ? null
              : AssignedVehicle.fromJson(
                json['assignedVehicle'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$LiveTrackingModelToJson(LiveTrackingModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'assignedVehicle': instance.assignedVehicle,
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
      startPointName: json['startPointName'] as String?,
      endPointName: json['endPointName'] as String?,
      checkPoint:
          (json['checkPoint'] as List<dynamic>?)
              ?.map((e) => CheckPoint.fromJson(e as Map<String, dynamic>))
              .toList(),
      deliveryStatus: json['deliveryStatus'] as String?,
      deliveryCompleted: json['deliveryCompleted'] as bool?,
      vehicleInStore: json['vehicleInStore'] as bool?,
      timerStartTime: json['timerStartTime'] as String?,
      radius: (json['radius'] as num?)?.toInt(),
      delayStatus: json['delayStatus'] as bool?,
      delayTime: (json['delayTime'] as num?)?.toInt(),
      natureofGoods: json['natureofGoods'] as String?,
      companyName:
          json['companyName'] == null
              ? null
              : CompanyNameModel.fromJson(
                json['companyName'] as Map<String, dynamic>,
              ),
      consignorName: json['consignorName'] as String?,
      managerName: json['managerName'] as String?,
      managerNumber: (json['managerNumber'] as num?)?.toInt(),
      storeName: json['storeName'] as String?,
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
    );

Map<String, dynamic> _$AssignedVehicleToJson(AssignedVehicle instance) =>
    <String, dynamic>{
      'startPoint': instance.startPoint,
      'endPoint': instance.endPoint,
      '_id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'vehicleNumber': instance.vehicleNumber,
      'startPointName': instance.startPointName,
      'endPointName': instance.endPointName,
      'checkPoint': instance.checkPoint,
      'deliveryStatus': instance.deliveryStatus,
      'deliveryCompleted': instance.deliveryCompleted,
      'vehicleInStore': instance.vehicleInStore,
      'timerStartTime': instance.timerStartTime,
      'radius': instance.radius,
      'delayStatus': instance.delayStatus,
      'delayTime': instance.delayTime,
      'natureofGoods': instance.natureofGoods,
      'companyName': instance.companyName,
      'consignorName': instance.consignorName,
      'managerName': instance.managerName,
      'managerNumber': instance.managerNumber,
      'storeName': instance.storeName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'consignmentLink': instance.consignmentLink,
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

CompanyNameModel _$CompanyNameModelFromJson(Map<String, dynamic> json) =>
    CompanyNameModel(
      id: json['_id'] as String?,
      companyName: json['companyName'] as String?,
      location: json['location'] as String?,
      timestamp:
          json['timestamp'] == null
              ? null
              : DateTime.parse(json['timestamp'] as String),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompanyNameModelToJson(CompanyNameModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'companyName': instance.companyName,
      'location': instance.location,
      'timestamp': instance.timestamp?.toIso8601String(),
      '__v': instance.v,
    };

Point _$PointFromJson(Map<String, dynamic> json) => Point(
  lati: (json['lati'] as num?)?.toDouble(),
  longi: (json['longi'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
  'lati': instance.lati,
  'longi': instance.longi,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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
