import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class DeviceEntity {
  final String deviceName;
  final String serialId;
  final double priceHour;
  final String type;
  final bool status;
  final User? user;

  DeviceEntity(
      {required this.deviceName,
      required this.priceHour,
      required this.type,
      required this.status,
      this.user,
      })
      : serialId = uuid.v4();
}

class User {
  final String name;
  final TimeOfDay beginTime;

  User({required this.name, required this.beginTime});
}
