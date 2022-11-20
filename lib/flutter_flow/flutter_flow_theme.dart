// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color primaryBtnText;
  late Color lineColor;
  late Color white;
  late Color transparent;
  late Color background;
  late Color greyscale900;
  late Color greyscale700;
  late Color btnText;
  late Color alertRed;
  late Color customColor4;
  late Color backgroundComponents;
  late Color alertGreen;
  late Color greyscale400;
  late Color greyscale100;
  late Color greyscale500;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFA3B0EF);
  late Color secondaryColor = const Color(0xFFFFD300);
  late Color tertiaryColor = const Color(0xFFF6F7FF);
  late Color alternate = const Color(0x14A3B0EF);
  late Color primaryBackground = const Color(0xFFFAFAFA);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF212121);
  late Color secondaryText = const Color(0xFF616161);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF35383F);
  late Color white = Color(0xFFFFFFFF);
  late Color transparent = Color(0x14A3B0EF);
  late Color background = Color(0xFFF6F7FF);
  late Color greyscale900 = Color(0xFF212121);
  late Color greyscale700 = Color(0xFF616161);
  late Color btnText = Color(0xFFFFFFFF);
  late Color alertRed = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFF090F13);
  late Color backgroundComponents = Color(0xFF1D2428);
  late Color alertGreen = Color(0xFF2FB73C);
  late Color greyscale400 = Color(0xFFBDBDBD);
  late Color greyscale100 = Color(0xFFF5F5F5);
  late Color greyscale500 = Color(0xFF9E9E9E);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Jua';
  TextStyle get title1 => GoogleFonts.getFont(
        'Jua',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 48,
        fontStyle: FontStyle.normal,
      );
  String get title2Family => 'Jua';
  TextStyle get title2 => GoogleFonts.getFont(
        'Jua',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 40,
        fontStyle: FontStyle.normal,
      );
  String get title3Family => 'Jua';
  TextStyle get title3 => GoogleFonts.getFont(
        'Jua',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32,
        fontStyle: FontStyle.normal,
      );
  String get subtitle1Family => 'Jua';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Jua',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24,
        fontStyle: FontStyle.normal,
      );
  String get subtitle2Family => 'Jua';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Jua',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
        fontStyle: FontStyle.normal,
      );
  String get bodyText1Family => 'Urbanist';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Urbanist',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontStyle: FontStyle.normal,
      );
  String get bodyText2Family => 'Urbanist';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Urbanist',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontStyle: FontStyle.normal,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFA3B0EF);
  late Color secondaryColor = const Color(0xFFFFD300);
  late Color tertiaryColor = const Color(0xFFF6F7FF);
  late Color alternate = const Color(0x14A3B0EF);
  late Color primaryBackground = const Color(0xFF181A20);
  late Color secondaryBackground = const Color(0xFF1F222A);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFFEEEEEE);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF35383F);
  late Color white = Color(0xFFFFFFFF);
  late Color transparent = Color(0x14A3B0EF);
  late Color background = Color(0xFFF6F7FF);
  late Color greyscale900 = Color(0xFF212121);
  late Color greyscale700 = Color(0xFF616161);
  late Color btnText = Color(0xFFFFFFFF);
  late Color alertRed = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFF090F13);
  late Color backgroundComponents = Color(0xFF1D2428);
  late Color alertGreen = Color(0xFF2FB73C);
  late Color greyscale400 = Color(0xFFBDBDBD);
  late Color greyscale100 = Color(0xFFF5F5F5);
  late Color greyscale500 = Color(0xFF9E9E9E);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
