import 'package:flutter/material.dart';

num calcauteTotalHours(TimeOfDay time) {
  var nowTime = TimeOfDay.now();
  num totalhours =
      ((nowTime.hour - time.hour) + ((nowTime.minute - time.minute) / 60.0))
          .abs();
  return totalhours;
}