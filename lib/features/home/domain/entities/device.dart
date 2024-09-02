import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class DeviceEntity {
  final String name;
  final String serialId;
  final double priceHour;
  final String type;
  final bool status;

  DeviceEntity(
      {required this.name,
      required this.priceHour,
      required this.type,
      required this.status})
      : serialId = uuid.v4();
}
