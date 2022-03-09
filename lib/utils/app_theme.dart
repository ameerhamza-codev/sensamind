import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindwatch/utils/app_colors.dart';

const Color _primaryColor = AppColors.primaryColor;

const Color _accentColor = AppColors.accentColor;

const Color _iconColor = Colors.black;

const AppBarTheme _appBarTheme = AppBarTheme(
  color: AppColors.primaryColor,
  textTheme: _defaultPrimaryTextTheme,
);
const Color _primaryTextColor = Colors.black;
const TextTheme _defaultPrimaryTextTheme = TextTheme(
  headline5: TextStyle(
    debugLabel: 'App display4',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 112,
  ),
  headline4: TextStyle(
    debugLabel: 'App display3',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 56,
  ),
  headline3: TextStyle(
    debugLabel: 'App display2',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 48,
  ),
  headline2: TextStyle(
    debugLabel: 'App display1',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 32,
  ),
  headline1: TextStyle(
    debugLabel: 'App headline',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 24,
  ),
  subtitle2: TextStyle(
    debugLabel: 'App title', //title
    inherit: true,
    color: _primaryTextColor,
    fontSize: 20,
  ),
  subtitle1: TextStyle(
    debugLabel: 'App title',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 16,
  ),
  headline6: TextStyle(
    debugLabel: 'App subhead',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 18,
  ),
  bodyText2: TextStyle(
    debugLabel: 'App body2',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 12,
  ),
  bodyText1: TextStyle(
    debugLabel: 'App body1',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 14,
  ),
  caption: TextStyle(
    debugLabel: 'App caption',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 12,
  ),
  button: TextStyle(
    debugLabel: 'App button',
    inherit: true,
    color: _primaryTextColor,
    fontSize: 14,
  ),
);

final TextTheme _appFontTextTheme =
    GoogleFonts.latoTextTheme(_defaultPrimaryTextTheme);

const IconThemeData appIconTheme = IconThemeData(
  color: _iconColor,
);

final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.textFieldFilledColor,
  hintStyle: _appFontTextTheme.subtitle2,
  border: const OutlineInputBorder(
    borderSide: BorderSide(color: _primaryColor, width: 1),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: _primaryColor, width: 1),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: _primaryColor, width: 1),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1),
  ),
  labelStyle: _appFontTextTheme.subtitle2.copyWith(
    color: _primaryColor,
  ),
);

final ThemeData _light = ThemeData.light();

final ThemeData appTheme = ThemeData.light().copyWith(
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: _primaryColor,
  ),
  primaryColor: _primaryColor,
  accentColor: _accentColor,
  textTheme: _appFontTextTheme,
  primaryIconTheme: appIconTheme,
  textSelectionColor: _primaryColor.withAlpha(150),
  textSelectionHandleColor: _primaryColor,
  appBarTheme: _appBarTheme,
  inputDecorationTheme: _inputDecorationTheme,
  iconTheme: appIconTheme,
  cursorColor: _primaryColor,
  buttonColor: _primaryColor,
  scaffoldBackgroundColor: Colors.deepPurple[50],
  floatingActionButtonTheme: _light.floatingActionButtonTheme.copyWith(
    backgroundColor: _primaryColor,
  ),
  buttonTheme: _light.buttonTheme.copyWith(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    textTheme: ButtonTextTheme.primary,
    buttonColor: AppColors.appWhite,
  ),
);
