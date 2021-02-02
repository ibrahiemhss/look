/**
 * Creating custom color palettes is part of creating a custom app. The idea is to create
 * your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
 * object with those colors you just defined.
 *
 * Resource:
 * A good resource would be this website: http://mcg.mbitson.com/
 * You simply need to put in the colour you wish to use, and it will generate all shades
 * for you. Your primary colour will be the `500` value.
 *
 * Colour Creation:
 * In order to create the custom colours you need to create a `Map<int, Color>` object
 * which will have all the shade values. `const Color(0xFF...)` will be how you create
 * the colours. The six character hex code is what follows. If you wanted the colour
 * #114488 or #D39090 as primary colours in your theme, then you would have
 * `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
 *
 * Usage:
 * In order to use this newly created theme or even the colours in it, you would just
 * `import` this file in your project, anywhere you needed it.
 * `import 'path/to/theme.dart';`
 */
import 'package:flutter/material.dart';

import 'colors/colors.dart';

final ThemeData themeData = new ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 96.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: Colors.white),
      headline2: TextStyle(
          fontSize: 60.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: Colors.white),
      headline3: TextStyle(
          fontSize: 48.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          color: Colors.white),
      headline4: TextStyle(
          fontSize: 34.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.white),
      headline5: TextStyle(
          fontSize: 24.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          color: Colors.white),
      headline6: TextStyle(
          fontSize: 20.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white),
      subtitle1: TextStyle(
          fontSize: 16.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.grey[900]),
      subtitle2: TextStyle(
          fontSize: 14.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
          color: Colors.white),
      bodyText1: TextStyle(
          fontSize: 16.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.grey[500]),
      bodyText2: TextStyle(
          fontSize: 14.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.grey[500]),
      button: TextStyle(
          fontSize: 14.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.75,
          color: AppColors.grey[500]),
      caption: TextStyle(
          fontSize: 12.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.grey[500]),
      overline: TextStyle(
          fontSize: 10.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.grey[500]),
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 96.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: Colors.white),
      headline2: TextStyle(
          fontSize: 60.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: Colors.white),
      headline3: TextStyle(
          fontSize: 48.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          color: Colors.white),
      headline4: TextStyle(
          fontSize: 34.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.white),
      headline5: TextStyle(
          fontSize: 24.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          color: Colors.white),
      headline6: TextStyle(
          fontSize: 20.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white),
      subtitle1: TextStyle(
          fontSize: 16.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.grey[900]),
      subtitle2: TextStyle(
          fontSize: 14.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
          color: AppColors.grey[600]),
      bodyText1: TextStyle(
          fontSize: 16.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.grey[500]),
      bodyText2: TextStyle(
          fontSize: 14.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.grey[500]),
      button: TextStyle(
          fontSize: 14.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.75,
          color: AppColors.grey[500]),
      caption: TextStyle(
          fontSize: 12.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.grey[500]),
      overline: TextStyle(
          fontSize: 10.0,
          //fontFamily: FontFamily.GESSTwo,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.grey[500]),
    ),
    iconTheme: new IconThemeData(color: AppColors.green[500]),
    appBarTheme: new AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      elevation: 16,
      iconTheme: IconThemeData(color: AppColors.green[500]),
    ),
    buttonColor: AppColors.green[600],
    textSelectionColor: AppColors.green[400],
    textSelectionHandleColor: AppColors.green[900],
    //fontFamily: FontFamily.GESSTwo,
    brightness: Brightness.light,
    primarySwatch: MaterialColor(AppColors.green[200].value, AppColors.green),
    primaryColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    backgroundColor: Colors.transparent,
    accentColor: AppColors.green[900],
    accentColorBrightness: Brightness.light);

final ThemeData themeDataDark = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 96.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: Colors.white),
    headline2: TextStyle(
        fontSize: 60.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: Colors.white),
    headline3: TextStyle(
        fontSize: 48.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: Colors.white),
    headline4: TextStyle(
        fontSize: 34.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white),
    headline5: TextStyle(
        fontSize: 24.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: AppColors.green[50]),
    headline6: TextStyle(
        fontSize: 20.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.white),
    subtitle1: TextStyle(
        fontSize: 16.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.white),
    subtitle2: TextStyle(
        fontSize: 14.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        color: AppColors.grey[50]),
    bodyText1: TextStyle(
        fontSize: 16.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.grey[50]),
    bodyText2: TextStyle(
        fontSize: 14.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.grey[50]),
    button: TextStyle(
        fontSize: 14.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.75,
        color: AppColors.grey[50]),
    caption: TextStyle(
        fontSize: 12.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.grey[50]),
    overline: TextStyle(
        fontSize: 10.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: AppColors.grey[50]),
  ),
  primaryTextTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 96.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: Colors.white),
    headline2: TextStyle(
        fontSize: 60.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: Colors.white),
    headline3: TextStyle(
        fontSize: 48.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: Colors.white),
    headline4: TextStyle(
        fontSize: 34.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white),
    headline5: TextStyle(
        fontSize: 24.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        color: Colors.white),
    headline6: TextStyle(
        fontSize: 20.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.white),
    subtitle1: TextStyle(
        fontSize: 16.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.white),
    subtitle2: TextStyle(
        fontSize: 14.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.10,
        color: AppColors.grey[50]),
    bodyText1: TextStyle(
        fontSize: 16.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.grey[50]),
    bodyText2: TextStyle(
        fontSize: 14.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.grey[50]),
    button: TextStyle(
        fontSize: 14.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.75,
        color: AppColors.grey[50]),
    caption: TextStyle(
        fontSize: 12.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.grey[50]),
    overline: TextStyle(
        fontSize: 10.0,
        //fontFamily: FontFamily.GESSTwo,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: AppColors.grey[50]),
  ),
  iconTheme: new IconThemeData(color: Colors.white),
  appBarTheme: new AppBarTheme(
    brightness: Brightness.dark,
    color: AppColors.green[500],
    elevation: 16,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonColor: AppColors.green[200],
  //fontFamily: FontFamily.GESSTwo,
  brightness: Brightness.dark,
  primaryColor: AppColors.green[500],
  backgroundColor: AppColors.green[700],
  primarySwatch: MaterialColor(AppColors.green[500].value, AppColors.green),
  primaryColorBrightness: Brightness.dark,
  accentColor: AppColors.green[500],
  accentColorBrightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.green[800],
    secondary: AppColors.green[600],
  ),
  // scaffoldBackgroundColor: Colors.transparent
);
