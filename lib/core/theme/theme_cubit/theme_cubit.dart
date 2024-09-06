import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/theme/themes.dart';
import 'package:game_store/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  bool isDark = getIt.get<SharedPreferences>().getBool(kThemeKeyBox) ?? false;

  void changeTheme() {
    isDark = !isDark;
    getIt.get<SharedPreferences>().setBool(kThemeKeyBox, isDark);
    emit(isDark ? darkTheme : lightTheme);
  }

  ThemeData getTheme() {
    return isDark ? darkTheme : lightTheme;
  }
}
