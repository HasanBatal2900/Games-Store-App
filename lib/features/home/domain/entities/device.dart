// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'device.g.dart';

var uuid = const Uuid();

@HiveType(typeId: 0)
class DeviceEntity {
  @HiveField(0)
  final String deviceName;
  @HiveField(1)
  final String? serialId;
  @HiveField(2)
  final num priceHour;
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
    String? serialId,
    required this.type,
    required this.status,
    this.userName,
    this.userBeginTime,
  }) : serialId = serialId ?? uuid.v4();

  DeviceEntity copyWith({
    String? deviceName,
    String? serialId,
    double? priceHour,
    String? type,
    bool? status,
    String? userName,
    TimeOfDay? userBeginTime,
  }) {
    return DeviceEntity(
      serialId: this.serialId,
      deviceName: deviceName ?? this.deviceName,
      priceHour: priceHour ?? this.priceHour,
      type: type ?? this.type,
      status: status ?? this.status,
      userName: userName ?? this.userName,
      userBeginTime: userBeginTime ?? this.userBeginTime,
    );
  }
}
