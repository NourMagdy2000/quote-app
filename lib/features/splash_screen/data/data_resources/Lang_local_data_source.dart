import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSouce {
  Future<String?> getSavedLang();
  Future<bool> changeLang({required String langCode});
}

class LangLocalDataSouceImp implements LangLocalDataSouce {
  SharedPreferences sharedPreferences;
  LangLocalDataSouceImp({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.localeCode, langCode);

  @override
  Future<String?> getSavedLang() async =>
      await sharedPreferences.containsKey(AppStrings.localeCode)
          ? sharedPreferences.getString(AppStrings.localeCode)
          : AppStrings.englishCode;
}
