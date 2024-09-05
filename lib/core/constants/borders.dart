import 'package:flutter/material.dart';

OutlineInputBorder kBorderOutlineStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
);

buildGeneralInputDecoration(BuildContext context,
    {required String label, required String hint}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    labelText: "Edit deviceName",
    hintText: "Edit deviceName",
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );
}
