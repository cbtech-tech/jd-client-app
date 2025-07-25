// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsignmentModel _$ConsignmentModelFromJson(Map<String, dynamic> json) =>
    ConsignmentModel(
      status: json['status'] as bool,
      count: (json['count'] as num).toInt(),
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ConsignmentModelToJson(ConsignmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  startPoint: Point.fromJson(json['startPoint'] as Map<String, dynamic>),
  endPoint: Point.fromJson(json['endPoint'] as Map<String, dynamic>),
  id: json['_id'] as String,
  phoneNumber: json['phoneNumber'] as String,
  vehicleNumber: json['vehicleNumber'] as String,
  startPointName: json['startPointName'] as String,
  endPointName: json['endPointName'] as String,
  checkPoint:
      (json['checkPoint'] as List<dynamic>)
          .map((e) => Checkpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
  deliveryStatus: json['deliveryStatus'] as String,
  deliveryCompleted: json['deliveryCompleted'] as bool,
  vehicleInStore: json['vehicleInStore'] as bool,
  timerStartTime: json['timerStartTime'] as String,
  radius: (json['radius'] as num).toInt(),
  delayStatus: json['delayStatus'] as bool,
  delayTime: (json['delayTime'] as num).toInt(),
  natureofGoods: json['natureofGoods'] as String,
  companyName: Company.fromJson(json['companyName'] as Map<String, dynamic>),
  consignorName: json['consignorName'] as String,
  managerName: json['managerName'] as String,
  managerNumber: (json['managerNumber'] as num).toInt(),
  consignmentLink: json['consignmentLink'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  v: (json['__v'] as num).toInt(),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'startPoint': instance.startPoint.toJson(),
  'endPoint': instance.endPoint.toJson(),
  '_id': instance.id,
  'phoneNumber': instance.phoneNumber,
  'vehicleNumber': instance.vehicleNumber,
  'startPointName': instance.startPointName,
  'endPointName': instance.endPointName,
  'checkPoint': instance.checkPoint.map((e) => e.toJson()).toList(),
  'deliveryStatus': instance.deliveryStatus,
  'deliveryCompleted': instance.deliveryCompleted,
  'vehicleInStore': instance.vehicleInStore,
  'timerStartTime': instance.timerStartTime,
  'radius': instance.radius,
  'delayStatus': instance.delayStatus,
  'delayTime': instance.delayTime,
  'natureofGoods': instance.natureofGoods,
  'companyName': instance.companyName.toJson(),
  'consignorName': instance.consignorName,
  'managerName': instance.managerName,
  'managerNumber': instance.managerNumber,
  'consignmentLink': instance.consignmentLink,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  '__v': instance.v,
};

Point _$PointFromJson(Map<String, dynamic> json) => Point(
  lati: (json['lati'] as num).toDouble(),
  longi: (json['longi'] as num).toDouble(),
);

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
  'lati': instance.lati,
  'longi': instance.longi,
};

Checkpoint _$CheckpointFromJson(Map<String, dynamic> json) => Checkpoint(
  lati: (json['lati'] as num).toDouble(),
  longi: (json['longi'] as num).toDouble(),
  name: json['name'] as String,
  completed: json['completed'] as bool,
  id: json['_id'] as String,
);

Map<String, dynamic> _$CheckpointToJson(Checkpoint instance) =>
    <String, dynamic>{
      'lati': instance.lati,
      'longi': instance.longi,
      'name': instance.name,
      'completed': instance.completed,
      '_id': instance.id,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  id: json['_id'] as String,
  companyName: json['companyName'] as String,
  location: json['location'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  v: (json['__v'] as num).toInt(),
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  '_id': instance.id,
  'companyName': instance.companyName,
  'location': instance.location,
  'timestamp': instance.timestamp.toIso8601String(),
  '__v': instance.v,
};
