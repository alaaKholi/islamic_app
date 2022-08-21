import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as AppLocale;
import 'package:intl/intl.dart';

import '../Helpers/assets_helper.dart';
import '../app/app.dart';
import '../helpers/colors_helper.dart';

class Utils {
  static AppLocale.AppLocalizations getString() {
    return AppLocale.AppLocalizations.of(
        Application.navigatorKey.currentContext!)!;
  }

  static formateDateTime(DateTime date) {
    return DateFormat('hh:mm:a').format(date.toLocal());
  }
}

class AppTextStyles {
  static getHeavyTextStyle(
      {double fontSize = 14,
      Color colorValue = AssetsColors.color_primary_orange}) {
    return TextStyle(
        color: colorValue,
        fontSize: fontSize,
        fontFamily: AssetsHelper.FONT_Avenir,
        fontWeight: FontWeight.w900);
  }

  static getBoldTextStyle(
      {double fontSize = 14, Color colorValue = Colors.white}) {
    return TextStyle(
        color: colorValue,
        fontSize: fontSize,
        fontFamily: AssetsHelper.FONT_Avenir,
        fontWeight: FontWeight.w700);
  }

  static getBoldTextStyleGreen(
      {double fontSize = 14,
      Color colorValue = AssetsColors.color_primary_orange}) {
    return TextStyle(
        color: colorValue,
        fontSize: fontSize,
        fontFamily: AssetsHelper.FONT_Avenir,
        fontWeight: FontWeight.w700);
  }

  static getMediumTextStyleColor(
      {double fontSize = 14, Color color = AssetsColors.color_primary_orange}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: AssetsHelper.FONT_Avenir,
        fontWeight: FontWeight.w500);
  }

  static getMediumTextStyle(
      {double fontSize = 14,
      Color colorValue = AssetsColors.color_primary_orange}) {
    return TextStyle(
        color: colorValue,
        fontSize: fontSize,
        fontFamily: AssetsHelper.FONT_Avenir,
        fontWeight: FontWeight.w500);
  }

  static getRegularTextStyle(
      {double fontSize = 14,
      Color colorValue = AssetsColors.color_primary_orange}) {
    return TextStyle(
        color: colorValue,
        fontSize: fontSize,
        fontFamily: AssetsHelper.FONT_Avenir,
        fontWeight: FontWeight.w400);
  }

  static getLightTextStyle(
      {double fontSize = 14, Color color = AssetsColors.color_primary_orange}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: AssetsHelper.FONT_Avenir,
        fontWeight: FontWeight.w300);
  }
}
