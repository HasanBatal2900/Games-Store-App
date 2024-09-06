import 'package:flutter/material.dart';
import 'package:game_store/core/constants/colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 6.0,
    backgroundColor: kPrimaryColor,
  ),
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white,
    elevation: 6.0,
    scrimColor: Colors.black.withOpacity(0.7),
  ),
  dividerColor: Colors.black,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: kPrimaryColor,
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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 6.0,
    backgroundColor: kPrimaryColor,
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  dividerColor: Colors.white,
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.black,
    elevation: 6.0,
    scrimColor: Colors.black.withOpacity(0.7),
  ),
  colorScheme: const ColorScheme.dark(
    onBackground: Colors.white,
    background: kBackgroundColor,
    primary: kPrimaryColor,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: kBackgroundColor,
    // .withOpacity(0.7),
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
