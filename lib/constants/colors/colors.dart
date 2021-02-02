import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const primaryColor =Color(0xFF21B6C9);

  static const Map<int, Color> green = const <int, Color>{
    50: const Color(0xFFF1F8E9),
    100: const Color(0xFFC8E6C9),
    200: const Color(0xFFA5D6A7),
    300: const Color(0xFF81C784),
    400: const Color(0xFF66BB6A),
    500: const Color(0xFF4CAF50),
    600: const Color(0xFF7CB342),
    700: const Color(0xFF689F38),
    800: const Color(0xFF558B2F),
    900: const Color(0xFF33691E)
  };
  static const Map<int, Color> grey = const <int, Color>{
    50: const Color(0xFFFAFAFA),
    100: const Color(0xFFF5F5F5),
    200: const Color(0xFFEEEEEE),
    300: const Color(0xFFE0E0E0),
    400: const Color(0xFFBDBDBD),
    500: const Color(0xFF9E9E9E),
    600: const Color(0xFF757575),
    700: const Color(0xFF616161),
    800: const Color(0xFF424242),
    900: const Color(0xFF212121)
  };
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
