import 'package:flutter/material.dart';
import 'package:game_store/core/constants/colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    brightness: Brightness.light,
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    onBackground: Colors.black,
    
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,
    elevation: 6.0,
    shadowColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    modalBarrierColor: Colors.black.withOpacity(0.1),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: kBackgroundColor.withOpacity(0.7),
    elevation: 6.0,
    shadowColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    modalBarrierColor: Colors.black.withOpacity(0.1),
    surfaceTintColor: Colors.amber,
  ),
);
