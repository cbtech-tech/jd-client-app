import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ConsignmentModel {
  final bool status;
  final int count;
  final List<Datum> data;

  ConsignmentModel({
    required this.status,
    required this.count,
    required this.data,
  });

  factory ConsignmentModel.fromJson(Map<String, dynamic> json) =>
      _$ConsignmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsignmentModelToJson(this);

  ConsignmentModel copyWith({
    bool? status,
    int? count,
    List<Datum>? data,
  }) {
    return ConsignmentModel(
      status: status ?? this.status,
      count: count ?? this.count,
      data: data ?? this.data,
    );
  }

  @override
  String toString() => 'ConsignmentModel(status: $status, count: $count, data: $data)';
}

@JsonSerializable(explicitToJson: true)
class Datum {
  final Point startPoint;
  final Point endPoint;
  @JsonKey(name: '_id')
  final String id;
  final String phoneNumber;
  final String vehicleNumber;
  final String startPointName;
  final String endPointName;
  final List<Checkpoint> checkPoint;
  final String deliveryStatus;
  final bool deliveryCompleted;
  final bool vehicleInStore;
  final String timerStartTime;
  final int radius;
  final bool delayStatus;
  final int delayTime;
  final String natureofGoods;
  final Company companyName;
  final String consignorName;
  final String managerName;
  final int managerNumber;
  final String consignmentLink;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: '__v')
  final int v;

  Datum({
    required this.startPoint,
    required this.endPoint,
    required this.id,
    required this.phoneNumber,
    required this.vehicleNumber,
    required this.startPointName,
    required this.endPointName,
    required this.checkPoint,
    required this.deliveryStatus,
    required this.deliveryCompleted,
    required this.vehicleInStore,
    required this.timerStartTime,
    required this.radius,
    required this.delayStatus,
    required this.delayTime,
    required this.natureofGoods,
    required this.companyName,
    required this.consignorName,
    required this.managerName,
    required this.managerNumber,
    required this.consignmentLink,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    Point? startPoint,
    Point? endPoint,
    String? id,
    String? phoneNumber,
    String? vehicleNumber,
    String? startPointName,
    String? endPointName,
    List<Checkpoint>? checkPoint,
    String? deliveryStatus,
    bool? deliveryCompleted,
    bool? vehicleInStore,
    String? timerStartTime,
    int? radius,
    bool? delayStatus,
    int? delayTime,
    String? natureofGoods,
    Company? companyName,
    String? consignorName,
    String? managerName,
    int? managerNumber,
    String? consignmentLink,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Datum(
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      startPointName: startPointName ?? this.startPointName,
      endPointName: endPointName ?? this.endPointName,
      checkPoint: checkPoint ?? this.checkPoint,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      deliveryCompleted: deliveryCompleted ?? this.deliveryCompleted,
      vehicleInStore: vehicleInStore ?? this.vehicleInStore,
      timerStartTime: timerStartTime ?? this.timerStartTime,
      radius: radius ?? this.radius,
      delayStatus: delayStatus ?? this.delayStatus,
      delayTime: delayTime ?? this.delayTime,
      natureofGoods: natureofGoods ?? this.natureofGoods,
      companyName: companyName ?? this.companyName,
      consignorName: consignorName ?? this.consignorName,
      managerName: managerName ?? this.managerName,
      managerNumber: managerNumber ?? this.managerNumber,
      consignmentLink: consignmentLink ?? this.consignmentLink,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'Datum(startPoint: $startPoint, endPoint: $endPoint, id: $id, phoneNumber: $phoneNumber, vehicleNumber: $vehicleNumber, '
        'startPointName: $startPointName, endPointName: $endPointName, checkPoint: $checkPoint, deliveryStatus: $deliveryStatus, '
        'deliveryCompleted: $deliveryCompleted, vehicleInStore: $vehicleInStore, timerStartTime: $timerStartTime, radius: $radius, '
        'delayStatus: $delayStatus, delayTime: $delayTime, natureofGoods: $natureofGoods, companyName: $companyName, '
        'consignorName: $consignorName, managerName: $managerName, managerNumber: $managerNumber, '
        'consignmentLink: $consignmentLink, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }
}

@JsonSerializable()
class Point {
  final double lati;
  final double longi;

  Point({required this.lati, required this.longi});

  factory Point.fromJson(Map<String, dynamic> json) =>
      _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);

  Point copyWith({double? lati, double? longi}) {
    return Point(
      lati: lati ?? this.lati,
      longi: longi ?? this.longi,
    );
  }

  @override
  String toString() => 'Point(lati: $lati, longi: $longi)';
}

@JsonSerializable()
class Checkpoint {
  final double lati;
  final double longi;
  final String name;
  final bool completed;
  @JsonKey(name: '_id')
  final String id;

  Checkpoint({
    required this.lati,
    required this.longi,
    required this.name,
    required this.completed,
    required this.id,
  });

  factory Checkpoint.fromJson(Map<String, dynamic> json) =>
      _$CheckpointFromJson(json);

  Map<String, dynamic> toJson() => _$CheckpointToJson(this);

  Checkpoint copyWith({
    double? lati,
    double? longi,
    String? name,
    bool? completed,
    String? id,
  }) {
    return Checkpoint(
      lati: lati ?? this.lati,
      longi: longi ?? this.longi,
      name: name ?? this.name,
      completed: completed ?? this.completed,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'Checkpoint(lati: $lati, longi: $longi, name: $name, completed: $completed, id: $id)';
  }
}

@JsonSerializable()
class Company {
  @JsonKey(name: '_id')
  final String id;
  final String companyName;
  final String location;
  final DateTime timestamp;
  @JsonKey(name: '__v')
  final int v;

  Company({
    required this.id,
    required this.companyName,
    required this.location,
    required this.timestamp,
    required this.v,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  Company copyWith({
    String? id,
    String? companyName,
    String? location,
    DateTime? timestamp,
    int? v,
  }) {
    return Company(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      location: location ?? this.location,
      timestamp: timestamp ?? this.timestamp,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'Company(id: $id, companyName: $companyName, location: $location, timestamp: $timestamp, v: $v)';
  }
}
