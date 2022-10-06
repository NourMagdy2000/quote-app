import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utiles/strings/app_strings.dart';

abstract class ModeLocalDataSouce {
  Future<bool?> getSavedMode();
  Future<bool> changeMode({required bool isLight});
}

class ModeLocalDataSouceImp implements ModeLocalDataSouce {
  SharedPreferences sharedPreferences;
  ModeLocalDataSouceImp({required this.sharedPreferences});

  @override
  Future<bool> changeMode({required bool isLight}) async =>
      await sharedPreferences.setBool(AppStrings.mode, isLight);

  @override
  Future<bool?> getSavedMode() async=>
    await sharedPreferences.containsKey(AppStrings.mode)
        ? sharedPreferences.getBool(AppStrings.mode)
        : true;

}
