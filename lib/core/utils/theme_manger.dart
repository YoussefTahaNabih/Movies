import 'package:flutter/material.dart';
import 'package:movies/core/utils/styles_manger.dart';
import 'package:movies/core/utils/values_manger.dart';

import 'colors_manger.dart';

ThemeData getAppTheme() {
  return ThemeData(
    backgroundColor: ColorManager.primary,
    // main colors
    primaryColor: ColorManager.primary,

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorManager.primary,
        elevation: SizeManger.s0,
        titleTextStyle: getRegularStyl(
            fontSize: SizeManger.s16, color: ColorManager.white, space: 1.2)),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyl(
                color: ColorManager.white,
                fontSize: SizeManger.s17,
                space: 1.2),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeManger.s12)))),

    // text theme
    textTheme: TextTheme(
      displayLarge: getLightStyl(
          color: ColorManager.white, fontSize: SizeManger.s22, space: 1.2),
      displaySmall: getLightStyl(
          color: ColorManager.white, fontSize: SizeManger.s10, space: 1.2),
      headlineLarge: getLightStyl(
          color: ColorManager.white, fontSize: SizeManger.s16, space: 1.2),
      titleMedium: getMediumStyle(
          color: ColorManager.white, fontSize: SizeManger.s12, space: 1.2),
      bodyLarge: getRegularStyl(
          color: ColorManager.white, fontSize: SizeManger.s14, space: 1.2),
      bodySmall: getRegularStyl(
          color: ColorManager.white, fontSize: SizeManger.s17, space: 1.2),
      bodyMedium: getLightStyl(
          color: ColorManager.white, fontSize: SizeManger.s8, space: 1.2),
    ),

    // input decoration theme (text form field)
  );
}
