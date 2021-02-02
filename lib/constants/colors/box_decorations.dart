import 'package:flutter/material.dart';

import 'colors.dart';

class BoxDecorations {
  BoxDecorations._();

  static BoxDecoration screensBoxDecoration({bool isDark}) => BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.1, 0.4, 0.7, 1.0],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          isDark ? Colors.grey[800] : AppColors.green[100],
          isDark ? Colors.grey[800] : AppColors.green[100],
          isDark ? Colors.grey[700] : AppColors.green[50],
          isDark ? Colors.grey[600] : AppColors.green[50],
        ],
      ));

  static BoxDecoration appBarBoxDecoration({bool isDark}) => BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.1, 0.4, 0.7, 1.0],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          isDark ? AppColors.green[500] : AppColors.green[100],
          isDark ? AppColors.green[500] : AppColors.green[100],
          isDark ? AppColors.green[400] : AppColors.green[50],
          isDark ? AppColors.green[300] : AppColors.green[50],
        ],
      ));

  static BoxDecoration neumorphicBoxDecoration({bool isDark}) => BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment(-1.0, -4.0),
            end: Alignment(1.0, 4.0),
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.4, 0.7, 1.0],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              isDark ? Colors.grey[700] : AppColors.green[50],
              isDark ? AppColors.grey[800] : AppColors.green[100],
              isDark ? AppColors.grey[800] : AppColors.green[100],
              isDark ? AppColors.grey[700] : AppColors.green[50],
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(35)),
          boxShadow: [
            BoxShadow(
                color: isDark ? AppColors.grey[800] : AppColors.green[100],
                offset: Offset(5.0, 5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: isDark ? AppColors.grey[800] : AppColors.green[100],
                offset: Offset(-5.0, -5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ]);
}
