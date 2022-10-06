import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:clean_artiticture_learning/core/useCases/useCases.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/use_cases/localization_use_cases/change_lang.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/use_cases/localization_use_cases/get_lang.dart';
import 'package:clean_artiticture_learning/features/splash_screen/domain/use_cases/mode_use_cases/get_mode.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/mode_use_cases/change_mode.dart';

part 'splash_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(
      {required this.getLatLang,
      required this.changeLang,
      required this.getLatMode,
      required this.changeMode})
      : super(changeLocalState());
  final GetLatMode getLatMode;
  final ChangeMode changeMode;
  final GetLatLang getLatLang;
  final ChangeLang changeLang;
  String currentLang = AppStrings.englishCode;
  bool checkMode=true;
   Locale?locale;
  Future getSavedLang() async {

    final response = await getLatLang.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLang = value!;
      locale = Locale(value);
      emit(changeLocalState());
    });
  }

  Future _changeLangMethod(String langCode) async {
    emit(loadingChangeLocalState());
    final response = await changeLang.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLang = langCode;
      locale = Locale(langCode);
      emit(changeLocalState());
    });
  }

  Future getSavedMode() async {
    final response = await getLatMode.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      checkMode = value!;
      emit(getModeState());
    });
  }

  Future changeModeMethod(bool islight) async {
    emit(loadinggetModeState());
    final response = await changeMode.call(islight);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      checkMode = islight;
      emit(changeModeState());
    });
  }

  void toEnglish() => _changeLangMethod(AppStrings.englishCode);
  void toArabic() => _changeLangMethod(AppStrings.arabicCode);

}
