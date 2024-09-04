// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

@HiveType(typeId: 0)
class DeviceEntity {
  @HiveField(0)
  final String deviceName;
  @HiveField(1)
  final String serialId;
  @HiveField(2)
  final double priceHour;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final bool status;
  @HiveField(5)
  final String? userName;
   @HiveField(6)
  final TimeOfDay? userBeginTime;

  DeviceEntity({
    required this.deviceName,
    required this.priceHour,
    required this.type,
    required this.status,
    this.userName,
    this.userBeginTime,
  }) : serialId = uuid.v4();
}

// class User {
//   final String name;
//   final TimeOfDay beginTime;

//   User({required this.name, required this.beginTime});
// }
