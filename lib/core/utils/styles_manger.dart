import 'package:flutter/material.dart';
import 'package:movies/core/utils/fonts_manger.dart';
import 'package:movies/core/utils/values_manger.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, double space) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontManger.fontFamliy,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: space,
  );
}

TextStyle getRegularStyl(
    {double fontSize = SizeManger.s12,
    required Color color,
    required double space}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color, space);
}

TextStyle getBoldStyl(
    {double fontSize = SizeManger.s12,
    required Color color,
    required double space}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color, space);
}

TextStyle getMediumStyle(
    {double fontSize = SizeManger.s12,
    required Color color,
    required double space}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color, space);
}

TextStyle getLightStyl(
    {double fontSize = SizeManger.s12,
    required Color color,
    required double space}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color, space);
}
