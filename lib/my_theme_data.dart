import 'package:app_news/appcolors.dart';
import 'package:flutter/material.dart';

class MyThemeData{
  static final ThemeData LightTheme = ThemeData(
primaryColor: AppColors.primaryLightColor,
    appBarTheme: AppBarTheme(
backgroundColor: AppColors.primaryLightColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft:Radius.circular(30),
          bottomRight:Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
titleLarge: TextStyle(
fontSize: 22,
  fontWeight: FontWeight.bold,
  color: AppColors.whiteColor,
),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
    ),
  );
}