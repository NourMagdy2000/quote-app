import 'package:clean_artiticture_learning/core/utiles/strings/app_colors.dart';
import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      fontFamily: AppStrings.myFontName,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(bodyText1: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),
          subtitle1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)));
}
ThemeData darkTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      fontFamily: AppStrings.myFontName,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
iconTheme: IconThemeData(color: Colors.white,),
      textTheme: TextTheme(bodyText1: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,color: Colors.white),
          subtitle1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)));
}
