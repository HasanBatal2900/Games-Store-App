import 'package:flutter/material.dart';

double calcauteTotalHours(TimeOfDay time) {
  var nowTime = TimeOfDay.now();
  double totalhours =
      ((nowTime.hour - time.hour) + ((nowTime.minute - time.minute) / 60.0))
          .abs()
          .roundToDouble();
  return totalhours;
}

double calcuteTolalPrice(double hours, double hourPrice) {
  return hours * hourPrice;
}
