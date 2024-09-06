import 'package:flutter/material.dart';

TimeOfDay stringToTimeOfDay({required String time}) {
  List<String> partOfTime = time.split(":");
  int hours = int.parse(partOfTime[0]);
  int minutes = int.parse(partOfTime[1]);

  return TimeOfDay(hour: hours, minute: minutes);
}
