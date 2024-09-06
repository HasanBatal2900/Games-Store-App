import 'package:flutter/material.dart';

String timeOfDayToString(TimeOfDay timeOfDay) {
  return timeOfDay.toString().substring(10, 15);
}
