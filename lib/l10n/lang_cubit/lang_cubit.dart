import 'package:bloc/bloc.dart';
import 'package:game_store/core/constants/keys.dart';
import 'package:game_store/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangagueCubit extends Cubit<String> {
  LangagueCubit() : super("ar");

  bool isArabic =
      getIt.get<SharedPreferences>().getBool(kLangagueLocaleKey) ?? true;

  void changeLang() {
    isArabic = !isArabic;
    getIt.get<SharedPreferences>().setBool(kLangagueLocaleKey, isArabic);
    emit(isArabic ? "ar" : "en");
  }

  String getLang() {
    return isArabic ? "ar" : "en";
  }
}
