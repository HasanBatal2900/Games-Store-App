import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

enum DeviceType {
  labtop,
  playStation,
  xBox,
}

Widget getDeviceIcon(DeviceType deviceType) {
  switch (deviceType) {
    case DeviceType.labtop:
      return const Icon(
        FontAwesomeIcons.laptop,
        color: Colors.indigo,
      );

    case DeviceType.playStation:
      return const Icon(
        FontAwesomeIcons.playstation,
        color: Colors.blue,
      );
    case DeviceType.xBox:
      return Icon(
        FontAwesomeIcons.xbox,
        color: Colors.greenAccent[400],
      );

    default:
      return const Icon(
        Icons.device_unknown_rounded,
        color: Colors.red,
      );
  }
}

Widget getDeviceIconByName(String type) {
  switch (type) {
    case "pc":
      return const Icon(
        FontAwesomeIcons.laptop,
        size: 18,
        color: Colors.indigo,
      );

    case "playStation":
      return const Icon(
        FontAwesomeIcons.playstation,
        color: Colors.blue,
      );
    case "xBox":
      return Icon(
        FontAwesomeIcons.xbox,
        color: Colors.greenAccent[400],
      );

    default:
      return const Icon(
        Icons.device_unknown_rounded,
        color: Colors.red,
      );
  }
}
